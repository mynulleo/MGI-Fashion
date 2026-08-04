<template>
    <index-page>
        <template v-slot:search-field>
            <v-select-container title="Select Page" field="search_data.page_id">
                <v-select v-if="pages.length > 0" v-model="search_data.page_id" label="title" :reduce="(obj) => obj.id"
                    :options="pages" placeholder="--Select Page--" :closeOnSelect="true"></v-select>
                <p v-else>Loading pages...</p>
            </v-select-container>
        </template>
    </index-page>
</template>

<script>
const model = "pageSeo";
const tableColumns = [
    {
        field: "image_three",
        zoom_field: "image_one",
        title: "Image",
        image: true,
        imgWidth: "30px",
        align: "center",
        enable_data_sorting: false,
    },
    { field: "page_id", title: "Page Title", subfield: "page.title" },
    { field: "meta_description", title: "Meta_description" },
    {
        field: "sorting",
        title: "Sorting",
        sorting: true,
        namespace: "pageSeo",
        auto: "",
        align: "center",
    },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Page Title": "page_id",
    "Meta Tags": "meta_tags",
    "Meta Description": "meta_description",
    // "Image": "image",
    "Sorting": "sorting",
};

export default {
    data() {
        return {
            page_title: "Page SEO List",
            model: model,
            json_fields: json_fields,
            fields_name: { default: "Select One", meta_description: "Meta Description" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                page_id: this.$route.query.page_id ?? "",
            },
            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: [],
            },
            pages: [],
        };
    },

    provide() {
        return {
            model: this.model,
            fields_name: this.fields_name,
            search_data: this.search_data,
            table: this.table,
            json_fields: this.json_fields,
            search: this.search,
            validate: this.validation,
            resetSearchData: this.resetSearchData,
        };
    },

    methods: {
        search() {
            this.$router.push({ name: this.model + '.index', query: { ...this.search_data } });
            this.get_paginate(this.model, this.search_data);
        },
        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page_id = '';
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";
        },
        getPages() {
            axios.get("support/page")
                .then((res) => {
                    this.pages = res.data;
                })
                .catch((error) => {
                    console.error('Error fetching pages:', error);
                });
        }
    },

    created() {
        this.getRouteName(this.model);
        this.setBreadcrumbs(this.model, "index");
        this.search();
        this.getPages();
    },
    validators: {
        "search_data.status": function (value = null) {
            return Validator.value(value);
        },
    }
};
</script>
