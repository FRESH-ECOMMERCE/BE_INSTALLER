"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.updatePassword = void 0;
const http_status_codes_1 = require("http-status-codes");
const responseFormater_1 = require("../../utilities/responseFormater");
const sequelize_1 = require("sequelize");
const validateRequest_1 = require("../../utilities/validateRequest");
const scure_password_1 = require("../../utilities/scure_password");
const logger_1 = __importDefault(require("../../utilities/logger"));
const user_1 = require("../../models/user");
const handleValidaionError_1 = __importDefault(require("../../utilities/handleValidaionError"));
const userSchema_1 = require("../../validations/userSchema");
const updatePassword = async (req, res) => {
    const { error, value } = (0, validateRequest_1.validateRequest)(userSchema_1.userUpdatePasswordSchema, req.body);
    if (error != null)
        return (0, handleValidaionError_1.default)(res, error);
    const { userPassword, userWhatsAppNumber } = value;
    try {
        const user = await user_1.UserModel.findOne({
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 },
                userWhatsAppNumber: { [sequelize_1.Op.eq]: userWhatsAppNumber },
                userRole: 'user'
            }
        });
        if (user == null) {
            const message = 'User not found!';
            logger_1.default.info('Attempt to update non-existing user');
            return res.status(http_status_codes_1.StatusCodes.NOT_FOUND).json(responseFormater_1.ResponseData.error(message));
        }
        const updatedData = {
            ...(userPassword && { userPassword: (0, scure_password_1.hashPassword)(userPassword) })
        };
        await user_1.UserModel.update(updatedData, {
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 },
                userWhatsAppNumber: { [sequelize_1.Op.eq]: userWhatsAppNumber }
            }
        });
        logger_1.default.info('Password updated successfully');
        const response = responseFormater_1.ResponseData.success();
        return res.status(http_status_codes_1.StatusCodes.OK).json(response);
    }
    catch (error) {
        const message = `Unable to process request! Error: ${error.message}`;
        logger_1.default.error(message, { stack: error.stack });
        return res.status(http_status_codes_1.StatusCodes.INTERNAL_SERVER_ERROR).json(responseFormater_1.ResponseData.error(message));
    }
};
exports.updatePassword = updatePassword;
