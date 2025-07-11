"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Pagination = void 0;
class Pagination {
    constructor(page, size) {
        this.limit = 10;
        this.offset = 0;
        this.page = 0;
        this.page = page;
        this.limit = size ?? 3;
        this.offset = page !== 0 ? page * this.limit : 0;
    }
    data(data) {
        return {
            total_items: data.count,
            items: data.rows,
            total_pages: Math.ceil(data.count / this.limit),
            current_page: this.page !== 0 ? this.page : 0
        };
    }
}
exports.Pagination = Pagination;
