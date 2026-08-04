<template>
    <index-page>
        <template v-slot:search-field>
        </template>
    </index-page>
</template>

<script>
const model = "page";

const tableColumns = [
    { field: "title", title: "Title" },
    /* {
        field: "sorting",
        title: "Sorting",
        sorting: true,
        namespace: "page",
        auto: "",
        align: "center",
    }, */
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    Title: "title",
};

export default {
    data() {
        return {
            page_title: "Page List",
            model: model,
            json_fields: json_fields,
            fields_name: { default: "Select One", title: "Title" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
            },
            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: [],
            },
        };
    },

    provide() {
        return {
            model: this.model,
            fields_name: this.fields_name,
            search_data: this.search_data,
            table: this.table,
            json_fields: this.json_fields,
            validate: this.validation,
            search: this.search,
        };
    },

    methods: {
        search() {
            this.$router.push({ name: this.model + '.index', query: { ...this.search_data } });
            this.get_paginate(this.model, this.search_data);
        },
    },

    created() {
        this.getRouteName(this.model, false);
        this.setBreadcrumbs(this.model, "index");
        this.search();
    },

    validators: {
        "search_data.status": function (value = null) {
            return Validator.value(value);
        },
    },
};
</script>
