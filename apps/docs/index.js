"use strict";
/**
 * @swagger
 * tags:
 *   name: Users
 *   description: User management
 */
/**
 * @swagger
 * /api/v1/users:
 *   post:
 *     summary: Create a new user
 *     tags: [Users]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - userName
 *               - userEmail
 *               - userPassword
 *               - userWhatsAppNumber
 *               - userRole
 *               - userGender
 *               - userFcmId
 *               - userPartnerCode
 *             properties:
 *               userName:
 *                 type: string
 *               userEmail:
 *                 type: string
 *                 format: email
 *               userPassword:
 *                 type: string
 *                 minLength: 6
 *               userWhatsAppNumber:
 *                 type: string
 *               userPhoto:
 *                 type: string
 *                 format: uri
 *               userRole:
 *                 type: string
 *                 enum: [user, admin, superAdmin]
 *               userGender:
 *                 type: string
 *                 enum: [pria, wanita]
 *               userCoin:
 *                 type: number
 *                 minimum: 0
 *                 default: 0
 *               userFcmId:
 *                 type: string
 *               userPartnerCode:
 *                 type: string
 *     responses:
 *       201:
 *         description: User created successfully
 *       400:
 *         description: Validation error
 */
/**
 * @swagger
 * /api/v1/users/{id}:
 *   patch:
 *     summary: Update user data
 *     tags: [Users]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: User ID
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               userName:
 *                 type: string
 *               userEmail:
 *                 type: string
 *                 format: email
 *               userPassword:
 *                 type: string
 *               userWhatsAppNumber:
 *                 type: string
 *               userPhoto:
 *                 type: string
 *                 format: uri
 *               userRole:
 *                 type: string
 *                 enum: [user, admin, superAdmin]
 *               userGender:
 *                 type: string
 *                 enum: [pria, wanita]
 *               userCoin:
 *                 type: number
 *               userFcmId:
 *                 type: string
 *               userPartnerCode:
 *                 type: string
 *     responses:
 *       200:
 *         description: User updated successfully
 *       400:
 *         description: Validation error
 */
/**
 * @swagger
 * /api/v1/users/{id}/password:
 *   patch:
 *     summary: Update user password
 *     tags: [Users]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: User ID
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - userPassword
 *             properties:
 *               userPassword:
 *                 type: string
 *                 minLength: 6
 *     responses:
 *       200:
 *         description: Password updated successfully
 *       400:
 *         description: Validation error
 */
