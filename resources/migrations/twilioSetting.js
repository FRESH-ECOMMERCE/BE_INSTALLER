/* eslint-disable @typescript-eslint/space-before-function-paren */
/* eslint-disable @typescript-eslint/no-var-requires */
'use strict'

const { ZygoteModel } = require('../zygote')

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, DataTypes) {
    await queryInterface.createTable('twilio_settings', {
      ...ZygoteModel,
      twilio_setting_id: {
        type: DataTypes.UUID,
        allowNull: false,
        defaultValue: DataTypes.UUIDV4
      },
      twilio_setting_account_sid: {
        type: DataTypes.STRING,
        allowNull: false
      },
      twilio_setting_auth_token: {
        type: DataTypes.STRING,
        allowNull: false
      },
      twilio_setting_verify_service: {
        type: DataTypes.STRING,
        allowNull: false
      }
    })
  },
  async down(queryInterface, DataTypes) {
    await queryInterface.dropTable('twilio_settings')
  }
}
