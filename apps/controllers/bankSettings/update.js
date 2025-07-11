"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.updateBankSetting = void 0;
const http_status_codes_1 = require("http-status-codes");
const response_1 = require("../../utilities/response");
const sequelize_1 = require("sequelize");
const requestCheker_1 = require("../../utilities/requestCheker");
const bankSettings_1 = require("../../models/bankSettings");
const logger_1 = __importDefault(require("../../utilities/logger"));
const updateBankSetting = async (req, res) => {
    const requestBody = req.body;
    const emptyField = (0, requestCheker_1.requestChecker)({
        requireList: ['bankSettingId'],
        requestData: requestBody
    });
    if (emptyField.length > 0) {
        const message = `invalid request parameter! require (${emptyField})`;
        const response = response_1.ResponseData.error(message);
        return res.status(http_status_codes_1.StatusCodes.BAD_REQUEST).json(response);
    }
    try {
        const result = await bankSettings_1.BankSettingsModel.findOne({
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 },
                bankSettingId: { [sequelize_1.Op.eq]: requestBody.bankSettingId }
            }
        });
        if (result == null) {
            const message = 'not found!';
            const response = response_1.ResponseData.error(message);
            return res.status(http_status_codes_1.StatusCodes.NOT_FOUND).json(response);
        }
        const newData = {
            ...(requestBody.bankSettingName.length > 0 && {
                bankSettingName: requestBody.bankSettingName
            }),
            ...(requestBody.bankSettingNumber.length > 0 && {
                bankSettingNumber: requestBody.bankSettingNumber
            }),
            ...(requestBody.bankSettingOwnerName.length > 0 && {
                bankSettingOwnerName: requestBody.bankSettingOwnerName
            })
        };
        await bankSettings_1.BankSettingsModel.update(newData, {
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 },
                bankSettingId: { [sequelize_1.Op.eq]: requestBody.bankSettingId }
            }
        });
        const response = response_1.ResponseData.default;
        response.data = { message: 'success' };
        return res.status(http_status_codes_1.StatusCodes.OK).json(response);
    }
    catch (error) {
        const message = `unable to process request! error ${error.message}`;
        logger_1.default.error(message);
        const response = response_1.ResponseData.error(message);
        return res.status(http_status_codes_1.StatusCodes.INTERNAL_SERVER_ERROR).json(response);
    }
};
exports.updateBankSetting = updateBankSetting;
