<template>
    <div class="content-part" v-if="!$root.spinner">
        <div class="top-short-summery">
            <!-- ekhane row er sathe g-4 class use korte hobe -->
            <div class="row g-4">
                <template v-for="(menu, index) in data.dashboardMenus" :key="index">
                    <div class="col-lg-6 col-xl-3 col-xxl-3 col-md-6">
                        <div class="summery-item">
                            <router-link :to="{ name: menu.route_name }">
                                <h4 class="text-capitalize">{{ menu.parent_title }}</h4>
                                <h3 class="counter text-capitalize">{{ menu.menu_name }}</h3>
                                <ul>
                                    <li>
                                        <span><i class="bi bi-arrow-up"></i>Total :
                                            {{ menu.total_data_count }}</span>
                                    </li>
                                </ul>
                                <div class="circle">
                                    <span v-html="menu.icon"> </span>
                                </div>
                            </router-link>
                        </div>
                    </div>
                </template>
            </div>
        </div>

        <div class="details-info py-xl-3">
            <div class="row">
                <div class="col-12 pb-3 col-md-6 col-lg-6 pb-lg-0">
                    <div class="pieChart-box">
                        <div class="title">
                            <!-- <h4>Title</h4> -->
                        </div>
                        <PieChart :chartData="pieChartData" :chartOptions="pieChartOptions" />
                    </div>
                </div>
                <!-- <div class="col-12 pb-3 col-md-6 col-lg-4 pb-md-0">
          <div class="pieChart-box">
            <div class="title">
              <h4>Title</h4>
            </div>
            <PieChart :chartData="pieChartData" :chartOptions="pieChartOptions" />
          </div>
        </div> -->
                <div class="col-12 pb-3 col-md-6 col-lg-6 pb-lg-0">
                    <div class="barChart-box">
                        <div class="title">
                            <!-- <h4>Title</h4> -->
                        </div>
                        <BarChart :chartData="barChartData" :chartOptions="barChartOptions" />
                    </div>
                </div>
            </div>
        </div>

        <div class="details-info">
            <div class="row">
                <div class="col-lg-12 col-xl-5 col-xxl-5">
                    <div class="projects">
                        <div class="title">
                            <h4>Login Information</h4>
                        </div>
                        <div class="project-table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>User Name</th>
                                        <th>Login At</th>
                                        <th>Login Ip</th>
                                        <th>Browser</th>
                                    </tr>
                                </thead>
                                <tbody style="border-top: 0">
                                    <template v-if="Object.keys(data.loginHistories).length > 0">
                                        <template v-for="(history, index) in data.loginHistories" :key="index">
                                            <tr>
                                                <td>{{ ++index }}</td>
                                                <td>{{ history.user.name }}</td>
                                                <td>{{ $filter.enFormat(history.login_at) }}</td>
                                                <td>{{ history.login_ip }}</td>
                                                <td>{{ history.login_browser_client }}</td>
                                            </tr>
                                        </template>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="6">
                                                <p class="text-center">No data available</p>
                                            </td>
                                        </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-xl-7 col-xxl-7">
                    <div class="projects">
                        <div class="title">
                            <h4>Recent Activity</h4>
                        </div>
                        <div class="project-table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Log Name</th>
                                        <th>Event Name</th>
                                        <th>Description</th>
                                        <th>Created at</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody style="border-top: 0">
                                    <template v-if="Object.keys(data.activities).length > 0">
                                        <template v-for="(activity, index) in data.activities" :key="index">
                                            <tr>
                                                <td>{{ ++index }}</td>
                                                <td>{{ activity.log_name }}</td>
                                                <td>{{ activity.event }}</td>
                                                <td>{{ activity.description }}</td>
                                                <td>{{ $filter.enFormat(activity.created_at) }}</td>
                                                <td>
                                                    <a :href="`${$root.baseurl}/activityLog/${activity.id}`">
                                                        <span class="delete view"><i class="fa-solid fa-eye"></i></span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </template>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="6">
                                                <p class="text-center">No data available</p>
                                            </td>
                                        </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import BarChart from "../../components/chart/bar.vue";
import PieChart from "../../components/chart/pie.vue";

export default {
    components: { BarChart, PieChart },
    data() {
        return {
            data: {
                dashboardMenus: {},
                activities: {},
                loginHistories: {},
            },
            barChartData: {
                labels: [],
                datasets: [
                    {
                        backgroundColor: "#c5cae9",
                        data: [],
                    },
                ],
            },
            barChartOptions: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true,
                    },
                },
            },
            pieChartData: {
                labels: [],
                datasets: [
                    {
                        labels: "Daily Report",
                        backgroundColor: [],
                        data: [],
                    },
                ],
            },
            pieChartOptions: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            },
        };
    },
    methods: {
        getDashboardData() {
            axios.get("/dashboard").then((response) => {
                this.data = response.data;
                const data = response.data;

                // Generate Pie Chart...
                this.generatePieChart(data);

                // Generate Bar Chart...
                this.generateBarChart(data);
            });
        },
        generateBarChart(data) {
            if (data && data.barData && data.barData.labels && data.barData.data) {
                const barLabels = [];
                const barData = [];

                data.barData.labels.forEach((element) => {
                    barLabels.push(element);
                });

                data.barData.data.forEach((element) => {
                    barData.push(element);
                });

                this.barChartData = {
                    labels: barLabels,
                    datasets: [
                        {
                            label: "User Statistics",
                            backgroundColor: ["#41B883", "#E46651", "#00D8FF", "#DD1B16"],
                            data: barData,
                        },
                    ],
                };
            } else {
                console.error("Invalid data format for generating bar chart");
            }
        },
        generatePieChart(data) {
            if (data && data.pieData && data.pieData.labels && data.pieData.data) {
                const pieLabels = [];
                const pieData = [];

                data.pieData.labels.forEach((element) => {
                    pieLabels.push(element);
                });

                data.pieData.data.forEach((element) => {
                    pieData.push(element);
                });

                this.pieChartData = {
                    labels: pieLabels,
                    datasets: [
                        {
                            backgroundColor: ["#41B883", "#E46651", "#00D8FF", "#DD1B16"],
                            data: pieData,
                        },
                    ],
                };
            } else {
                console.error("Invalid data format for generating pie chart");
            }
        },
    },
    created() {
        this.getDashboardData();
        this.setBreadcrumbs(this.model, "index", "Dashboard");
    },
};
</script>
