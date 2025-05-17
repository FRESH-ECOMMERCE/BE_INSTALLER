/* eslint-disable @typescript-eslint/space-before-function-paren */
'use strict'
/** @type {import('sequelize-cli').Migration} */

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('settings', [
      {
        setting_id: 're32432ewr3454',
        setting_banner:
          '["https://firebasestorage.googleapis.com/v0/b/mendigitalkan.appspot.com/o/e-commerce%2Fdiscountbanner1.jpeg?alt=media&token=be3b9b94-e502-4e2b-8d97-9b86f2eab226", "https://firebasestorage.googleapis.com/v0/b/mendigitalkan.appspot.com/o/e-commerce%2Fdiscountbanner2.webp?alt=media&token=a3aa244e-72bf-44a9-bbe7-67d26030f991"]',
        setting_whatsapp_number: '6283168421426'
      }
    ])
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('settings', null, {})
  }
}
