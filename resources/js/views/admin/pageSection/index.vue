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

const model = "pageSection";

const tableColumns = [
    /* {
        field: "icon",
        title: "Icon",
        image: true,
        imgWidth: "30px",
        align: "center",
    }, */
    {
        field: "image_three",
        zoom_field: "image_one",
        title: "Image",
        image: true,
        imgWidth: "30px",
        align: "center",
        enable_data_sorting: false,
    },
    { field: "title", title: "Title", },
    { field: "page_id", title: "Page", subfield: "page.title" },
    {
        field: "sorting",
        title: "Sorting",
        sorting: true,
        namespace: "PageSection",
        auto: "",
        align: "center",
    },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    Page: "page_id",
    Type: "type",
    Title: "title",
    Icon: "icon",
    Image: "image",
    Sorting: "sorting",
};

export default {

    data() {
        return {
            page_title: "Page Section List",
            model: model,
            json_fields: json_fields,
            fields_name: { default: "Select One", title: "Title" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                page_id: this.$route.query.page_id ?? "",
            },
            pages: [],
            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: []
            }

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
            resetSearchData: this.resetSearchData,
        };
    },

    methods: {
        getPages() {
            axios.get("support/page")
                .then((res) => {
                    this.pages = res.data;
                })
                .catch((error) => {
                    console.error('Error fetching pages:', error);
                });
        },

        search() {
            let messages = [];
            for (let key in this.search_data) {
                if (this.search_data[key] !== "" && key !== "pagination" && key !== "page" && key !== "field_name" && key !== "value") {
                    messages.push(`${key}`);
                }
            }
            if (messages.length > 0) {
                this.$toast("Search by  :" + messages.join(", "), "info","", 100000);
            }
            this.$router.push({ name: this.model + '.index', query: { ...this.search_data } });
            this.get_paginate(this.model, this.search_data);
        },

        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page_id = "";
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";
        },
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
