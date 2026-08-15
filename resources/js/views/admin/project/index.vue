<template>
    <index-page>
        <template v-slot:search-field>
            <v-select-container field="search_data.category_id" title="Categories">
                <v-select v-model="search_data.category_id" label="title" :reduce="(obj) => obj.id"
                    :options="categories" placeholder="--Select One--" :closeOnSelect="true" :req="true"></v-select>
            </v-select-container>
            <date-picker id="date4" field="search_data.from_date" name="start_date" v-model="search_data.from_date"
                title="From Date" placeholder="dd/mm/yyyy" col="4" label="From Date" :tooltip="false"
                disableToDates=""></date-picker>
            <date-picker id="date5" field="search_data.to_date" name="end_date" v-model="search_data.to_date"
                title="To Date" placeholder="dd/mm/yyyy" col="4" label="To Date" disableToDates=""
                :disableToDates="disabledDateforToDate"></date-picker>
        </template>
    </index-page>
</template>

<script>
import axios from "axios";
const model = "project";
import { mapState } from "vuex";

const tableColumns = [
    { field: "title", title: "Title" },
    {
        field: "category_id",
        title: "Categories",
        subfield: "category.title",
    },

    {
        field: "image_one",
        zoom_field: "original_image",
        title: "Image",
        image: true,
        imgWidth: "50px",
        align: "center",
    },
    { field: "start_date", title: "Start Date" },
    { field: "end_date", title: "End Date" },
    { field: "website", title: "Website" },
    { field: "funded_by", title: "Funded By" },
    {
        field: "sorting",
        title: "Sorting",
        sorting: true,
        namespace: "project",
        auto: "",
        align: "center",
    },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    Image: "image",
    Title: "title",
    Category_id: "category_id",
    "Start Date": "start_date",
    "End Date": "end_date",
    Website: "website",
    "Funded By": "funded_by",
    Description: "description",
};

export default {
    data() {
        return {
            disablePastDates: false,
            disableToDate: 14,
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: {
                default: "Select One",
                title: "Title",
                funded_by: "Funded By",
            },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                from_date: this.$route.query.from_date ?? "",
                to_date: this.$route.query.to_date ?? "",
            },
            categories: [],

            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: [],
            },
        };
    },

    computed: {
        disabledDateforToDate() {
            return this.search_data.from_date.length > 0
                ? this.search_data.from_date
                : moment().format("DD MMMM, YYYY");
        },
    },

    provide() {
        return {
            validate: this.validation,
            model: this.model,
            fields_name: this.fields_name,
            search_data: this.search_data,
            table: this.table,
            json_fields: this.json_fields,
            search: this.search,
            resetSearchData: this.resetSearchData,
        };
    },

    methods: {
        search() {
            this.get_paginate(this.model, this.search_data);
        },
        getcategory() {
            axios.get("/getcategory").then((response) => {
                console.log(response.data);
                this.categories = response.data;
            });
        },
        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page = 1;
            this.search_data.field_name = "";
            this.search_data.website = "";
            this.search_data.status = "";
            this.search_data.from_date = "";
            this.search_data.to_date = "";
            this.search_data.category_id = "";
        },
    },

    created() {
        this.getcategory();
        this.getRouteName(this.model);
        this.page_title = "Product List";
        this.search();
    },

    validators: {
        "search_data.from_date": function (value = null) {
            return Validator.value(value);
        },
        "search_data.to_date": function (value = null) {
            const that = this;
            return Validator.value(value).custom(function () {
                if (!Validator.isEmpty(value) && that.search_data.to_date) {
                    const end = new Date(value);
                    const start = new Date(that.search_data.from_date);

                    if (start > end) {
                        return "End date must higher";
                    }
                }
            });
        },
    },
};
</script>
