"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.waBlasSendMessage = void 0;
const http_status_codes_1 = require("http-status-codes");
const response_1 = require("../../utilities/response");
const sequelize_1 = require("sequelize");
const waBlasHistory_1 = require("../../models/waBlasHistory");
const uuid_1 = require("uuid");
const axios_1 = __importDefault(require("axios"));
const requestCheker_1 = require("../../utilities/requestCheker");
const user_1 = require("../../models/user");
const waBlasSettings_1 = require("../../models/waBlasSettings");
const waBlasSendMessage = async (req, res) => {
    const requestBody = req.body;
    const emptyField = (0, requestCheker_1.requestChecker)({
        requireList: ['waBlasTitle', 'waBlasMessage'],
        requestData: requestBody
    });
    if (emptyField.length > 0) {
        const message = `invalid request parameter! require (${emptyField})`;
        const response = response_1.ResponseData.error(message);
        return res.status(http_status_codes_1.StatusCodes.BAD_REQUEST).json(response);
    }
    try {
        const users = await user_1.UserModel.findAll({
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 },
                userRole: 'user'
            }
        });
        console.log('====1');
        for (const user of users) {
            if (user.dataValues.userWhatsAppNumber !== null) {
                const payload = {
                    waBlasHistoryId: (0, uuid_1.v4)(),
                    waBlasHistoryUserId: user.dataValues.userId,
                    waBlasHistoryUserPhone: user.dataValues.userWhatsAppNumber,
                    waBlasHistoryUserName: user.dataValues.userName,
                    waBlasHistoryTitle: requestBody.waBlasTitle,
                    waBlasHistoryMessage: requestBody.waBlasMessage
                };
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
                    await axios_1.default.get(`${waBlasSettings.waBlasSettingServer}/send-message?phone=${user.dataValues.userWhatsAppNumber}&message=${requestBody.waBlasMessage}&token=${waBlasSettings.waBlasSettingToken}`);
                    payload.waBlasStatus = 'success';
                    await waBlasHistory_1.WaBlasHistoryModel.create(payload);
                }
                catch {
                    payload.waBlasStatus = 'fail';
                    continue;
                }
                await waBlasHistory_1.WaBlasHistoryModel.create(payload);
            }
        }
        const response = response_1.ResponseData.default;
        response.data = { message: 'succsess' };
        return res.status(http_status_codes_1.StatusCodes.OK).json(response);
    }
    catch (error) {
        console.log(error.message);
        const message = `unable to process request! error ${error.message}`;
        const response = response_1.ResponseData.error(message);
        return res.status(http_status_codes_1.StatusCodes.INTERNAL_SERVER_ERROR).json(response);
    }
};
exports.waBlasSendMessage = waBlasSendMessage;
