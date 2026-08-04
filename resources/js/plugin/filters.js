import moment from "moment"

let filters = {

    /**
     *
     * @param {string} value
     * @param {string} format
     * @returns
     */
    enFormat(value, format = 'll') {
        moment.locale('en-gb');
        const time = moment(String(value)).format(format);

        if (time == 'Invalid date') {
            return "-"
        }

        return time;
    },

    /**
     *
     * @param {string} str
     * @returns
     */
    capitalize(str) {
        if (!str) return '-';
        return String(str)
            .replace(/and/ig, '&')
            .replace(/\-|\_/ig, ' ')
            .replace(/([A-Z][^A-Z]+)/g, ' $1')
            .split(' ')
            .map((x) => x.charAt(0).toUpperCase() + x.slice(1))
            .join(' ');
    },
}

export default {
    install: function (app) {
        app.config.globalProperties.$filter = filters;
    }
};
