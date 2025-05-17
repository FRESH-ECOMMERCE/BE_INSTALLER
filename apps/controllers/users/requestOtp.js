"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.requestOtp = void 0;
const http_status_codes_1 = require("http-status-codes");
const sequelize_1 = require("sequelize");
const axios_1 = __importDefault(require("axios"));
const validateRequest_1 = require("../../utilities/validateRequest");
const response_1 = require("../../utilities/response");
const logger_1 = __importDefault(require("../../utilities/logger"));
const user_1 = require("../../models/user");
const redis_1 = __importDefault(require("../../configs/redis"));
const userSchema_1 = require("../../validations/userSchema");
const handleValidaionError_1 = __importDefault(require("../../utilities/handleValidaionError"));
const waBlasSettings_1 = require("../../models/waBlasSettings");
const requestOtp = async (req, res) => {
    const { error } = (0, validateRequest_1.validateRequest)(userSchema_1.requestOtpSchema, req.body);
    if (error != null)
        return (0, handleValidaionError_1.default)(res, error);
    const requestBody = req.body;
    try {
        const waBlasSettings = await waBlasSettings_1.WaBlasSettingModel.findOne({
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 }
            }
        });
        if (waBlasSettings === null) {
            const message = 'periksa pengaturan terlebih dahulu, pastikan semua sudah benar!';
            const response = response_1.ResponseData.error(message);
            return res.status(http_status_codes_1.StatusCodes.NOT_FOUND).json(response);
        }
        const existingUser = await user_1.UserModel.findOne({
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 },
                userWhatsAppNumber: { [sequelize_1.Op.eq]: requestBody.whatsappNumber }
            }
        });
        if (requestBody.otpType === 'resetPassword' && existingUser === null) {
            const message = `whatsapp number ${requestBody.whatsappNumber} is not registered.`;
            logger_1.default.info(`Registration attempt failed: ${message}`);
            return res.status(http_status_codes_1.StatusCodes.BAD_REQUEST).json(response_1.ResponseData.error(message));
        }
        if (requestBody.otpType === 'register' && existingUser !== null) {
            const message = `whatsapp number ${requestBody.whatsappNumber} is already registered.`;
            logger_1.default.info(`Registration attempt failed: ${message}`);
            return res.status(http_status_codes_1.StatusCodes.BAD_REQUEST).json(response_1.ResponseData.error(message));
        }
        const otpCode = Math.floor(100000 + Math.random() * 900000).toString();
        const minutes = 300;
        await redis_1.default.setex(`otp:${otpCode}`, minutes, otpCode);
        const message = encodeURIComponent(`*${otpCode}* adalah kode verifikasi Anda.\n\n` +
            'Pengingat keamanan: Untuk memastikan keamanan akun Anda, mohon jangan bagikan informasi apa pun tentang akun Anda kepada siapa pun.');
        const wablasResponse = await axios_1.default.get(`${waBlasSettings.waBlasSettingServer}/send-message?phone=${requestBody.whatsappNumber}&message=${message}&token=${waBlasSettings.waBlasSettingToken}`);
        if (wablasResponse.status !== 200) {
            throw new Error('Failed to send OTP');
        }
        const response = response_1.ResponseData.default;
        return res.status(http_status_codes_1.StatusCodes.CREATED).json(response);
    }
    catch (error) {
        const message = `unable to process request! error ${error.message}`;
        const response = response_1.ResponseData.error(message);
        return res.status(http_status_codes_1.StatusCodes.INTERNAL_SERVER_ERROR).json(response);
    }
};
exports.requestOtp = requestOtp;
