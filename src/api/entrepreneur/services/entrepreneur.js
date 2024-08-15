'use strict';

/**
 * entrepreneur service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::entrepreneur.entrepreneur');
