"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.findWaBlasSettings = void 0;
const http_status_codes_1 = require("http-status-codes");
const response_1 = require("../../utilities/response");
const sequelize_1 = require("sequelize");
const waBlasSettings_1 = require("../../models/waBlasSettings");
const logger_1 = __importDefault(require("../../utilities/logger"));
const findWaBlasSettings = async (req, res) => {
    try {
        const waBlasSettings = await waBlasSettings_1.WaBlasSettingModel.findOne({
            where: {
                deleted: { [sequelize_1.Op.eq]: 0 }
            }
        });
        const response = response_1.ResponseData.default;
        response.data = waBlasSettings;
        return res.status(http_status_codes_1.StatusCodes.OK).json(response);
    }
    catch (error) {
        const message = `unable to process request! error ${error.message}`;
        logger_1.default.error(message);
        const response = response_1.ResponseData.error(message);
        return res.status(http_status_codes_1.StatusCodes.INTERNAL_SERVER_ERROR).json(response);
    }
};
exports.findWaBlasSettings = findWaBlasSettings;
