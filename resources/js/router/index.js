import { createRouter, createWebHistory } from "vue-router";

// Define Route...
const routes = [
    {
        path: "",
        component: () => import("../views/admin/layout.vue"),
        beforeEnter: checkAuth,
        children: [
            // ------------------MENU PORTION------------------
            {
                path: "/frontMenu",
                name: "frontMenu.index",
                meta: {
                    title: "Menu",
                    nav: true,
                },
                component: () => import("./../views/admin/website/menu/index"),
            },
            {
                path: "/frontMenu/create",
                name: "frontMenu.create",
                component: () => import("./../views/admin/website/menu/create"),
            },
            {
                path: "/frontMenu/:id",
                name: "frontMenu.show",
                component: () => import("./../views/admin/website/menu/view"),
            },
            {
                path: "/frontMenu/:id/edit",
                name: "frontMenu.edit",
                component: () => import("./../views/admin/website/menu/create"),
            },
            // ------------------CONTENT PORTION------------------
            {
                path: "/content",
                name: "content.index",
                component: () =>
                    import("./../views/admin/website/content/index"),
            },
            {
                path: "/content/create",
                name: "content.create",
                component: () =>
                    import("./../views/admin/website/content/create"),
            },
            {
                path: "/content/:slug",
                name: "content.show",
                component: () =>
                    import("./../views/admin/website/content/view"),
            },
            {
                path: "/content/:slug/edit",
                name: "content.edit",
                component: () =>
                    import("./../views/admin/website/content/create"),
            },
            {
                path: "/content-file/:slug",
                name: "content.file",
                component: () =>
                    import("./../views/admin/website/content/createFile"),
            },
            // ------------------SLIDER PORTION------------------
            {
                path: "/slider",
                name: "slider.index",
                meta: {
                    title: "Slider",
                    nav: true,
                },
                component: () =>
                    import("./../views/admin/website/gallery/slider/index"),
            },
            {
                path: "/slider/create",
                name: "slider.create",
                component: () =>
                    import("./../views/admin/website/gallery/slider/create"),
            },
            {
                path: "/slider/:id",
                name: "slider.show",
                component: () =>
                    import("./../views/admin/website/gallery/slider/view"),
            },
            {
                path: "/slider/:id/edit",
                name: "slider.edit",
                component: () =>
                    import("./../views/admin/website/gallery/slider/create"),
            },

            // ------------------Slider Details portion------------------
            {
                path: "/slider-details",
                name: "slider-details.index",
                meta: {
                    title: "Slider Details",
                    nav: true,
                },
                component: () =>
                    import("./../views/admin/website/gallery/slider/details/index"),
            },
            {
                path: "/slider-details/create",
                name: "slider-details.create",
                component: () =>
                    import("./../views/admin/website/gallery/slider/details/create"),
            },
            {
                path: "/slider-details/:id",
                name: "slider-details.show",
                component: () =>
                    import("./../views/admin/website/gallery/slider/details/view"),
            },
            {
                path: "/slider-details/:id/edit",
                name: "slider-details.edit",
                component: () =>
                    import("./../views/admin/website/gallery/slider/details/create"),
            },

            // ------------------ALBUM PORTION------------------
            {
                path: "/album",
                name: "album.index",
                meta: {
                    title: "Album",
                    nav: true,
                },
                component: () =>
                    import("./../views/admin/website/gallery/album/index"),
            },
            {
                path: "/album/create",
                name: "album.create",
                component: () =>
                    import("./../views/admin/website/gallery/album/create"),
            },
            {
                path: "/album/:id",
                name: "album.show",
                component: () =>
                    import("./../views/admin/website/gallery/album/view"),
            },
            {
                path: "/album/:id/edit",
                name: "album.edit",
                component: () =>
                    import("./../views/admin/website/gallery/album/create"),
            },
            // ------------------PHOTO PORTION------------------
            {
                path: "/photo",
                name: "photo.index",
                meta: {
                    title: "Photo",
                    nav: true,
                },
                component: () =>
                    import("./../views/admin/website/gallery/photo/index"),
            },
            {
                path: "/photo/create",
                name: "photo.create",
                component: () =>
                    import("./../views/admin/website/gallery/photo/create"),
            },
            {
                path: "/photo/:id",
                name: "photo.show",
                component: () =>
                    import("./../views/admin/website/gallery/photo/view"),
            },
            {
                path: "/photo/:id/edit",
                name: "photo.edit",
                component: () =>
                    import("./../views/admin/website/gallery/photo/edit"),
            },
            // ------------------VIDEO PORTION------------------
            {
                path: "/video",
                name: "video.index",
                meta: {
                    title: "Video",
                    nav: true,
                },
                component: () =>
                    import("./../views/admin/website/gallery/video/index"),
            },
            {
                path: "/video/create",
                name: "video.create",
                component: () =>
                    import("./../views/admin/website/gallery/video/create"),
            },
            {
                path: "/video/:id",
                name: "video.show",
                component: () =>
                    import("./../views/admin/website/gallery/video/view"),
            },
            {
                path: "/video/:id/edit",
                name: "video.edit",
                component: () =>
                    import("./../views/admin/website/gallery/video/create"),
            },
            // ------------------News portion------------------
            {
                path: "/news",
                name: "news.index",
                meta: {
                    title: "News",
                    nav: true,
                },
                component: () => import("./../views/admin/website/news/index"),
            },
            {
                path: "/news/create",
                name: "news.create",
                component: () => import("./../views/admin/website/news/create"),
            },
            {
                path: "/news/:id",
                name: "news.show",
                component: () => import("./../views/admin/website/news/view"),
            },
            {
                path: "/news/:id/edit",
                name: "news.edit",
                component: () => import("./../views/admin/website/news/create"),
            },
            // ------------------Notice portion------------------
            {
                path: "/notice",
                name: "notice.index",
                meta: {
                    title: "Notice",
                    nav: true,
                },
                component: () =>
                    import("./../views/admin/website/notice/index"),
            },
            {
                path: "/notice/create",
                name: "notice.create",
                component: () =>
                    import("./../views/admin/website/notice/create"),
            },
            {
                path: "/notice/:id",
                name: "notice.show",
                component: () => import("./../views/admin/website/notice/view"),
            },
            {
                path: "/notice/:id/edit",
                name: "notice.edit",
                component: () =>
                    import("./../views/admin/website/notice/create"),
            },

            // ------------------ADMIN PORTION------------------
            {
                path: "/dashboard",
                name: "dashboard.index",
                component: () => import("./../views/admin/dashboard.vue"),
            },
            {
                path: "/admin",
                name: "admin.index",
                component: () => import("./../views/admin/admin/index"),
            },
            {
                path: "/admin/create",
                name: "admin.create",
                component: () => import("./../views/admin/admin/create"),
            },
            {
                path: "/admin/:id",
                name: "admin.show",
                component: () => import("./../views/admin/admin/view"),
            },
            {
                path: "/admin/:id/edit",
                name: "admin.edit",
                component: () => import("./../views/admin/admin/create"),
            },

            // ------------------User Profile------------------
            {
                path: "/profile",
                name: "profile.profileDetails",
                component: () => import("./../views/admin/admin/profile"),
            },

            // ------------------ROLE PORTION------------------
            {
                path: "/role",
                name: "role.index",
                component: () => import("./../views/admin/system/role/index"),
            },
            {
                path: "/role/create",
                name: "role.create",
                component: () => import("./../views/admin/system/role/create"),
            },
            {
                path: "/role/:id",
                name: "role.show",
                component: () => import("./../views/admin/system/role/view"),
            },
            {
                path: "/role/:id/edit",
                name: "role.edit",
                component: () => import("./../views/admin/system/role/create"),
            },
            // ------------------MENU PORTION------------------
            {
                path: "/menu",
                name: "menu.index",
                component: () => import("./../views/admin/system/menu/index"),
            },
            {
                path: "/menu/create",
                name: "menu.create",
                component: () => import("./../views/admin/system/menu/create"),
            },
            {
                path: "/menu/:id",
                name: "menu.show",
                component: () => import("./../views/admin/system/menu/view"),
            },
            {
                path: "/menu/:id/edit",
                name: "menu.edit",
                component: () => import("./../views/admin/system/menu/create"),
            },
            // ------------------SITE SETTING PORTION------------------
            {
                path: "/siteSetting",
                name: "siteSetting.show",
                component: () =>
                    import("./../views/admin/system/siteSettings/view"),
            },
            {
                path: "/siteSetting/create",
                name: "siteSetting.create",
                component: () =>
                    import("./../views/admin/system/siteSettings/create"),
            },

            {
                path: "/siteSetting/edit",
                name: "siteSetting.edit",
                component: () =>
                    import("./../views/admin/system/siteSettings/create"),
            },
            // ------------------MODULE PORTION------------------
            {
                path: "/module",
                name: "module.index",
                component: () => import("./../views/admin/system/module/index"),
            },
            {
                path: "/module/create",
                name: "module.create",
                component: () =>
                    import("./../views/admin/system/module/create"),
            },
            // ------------------ACTIVITY LOG PORTION------------------
            {
                path: "/activityLog",
                name: "activityLog.index",
                component: () =>
                    import("./../views/admin/system/activityLog/index"),
            },
            {
                path: "/activityLog/:id",
                name: "activityLog.show",
                component: () =>
                    import("./../views/admin/system/activityLog/view"),
            },
            {
                path: "/sitemap",
                name: "sitemap.index",
                component: () =>
                    import("./../views/admin/system/sitemap/Index"),
            },

            // ------------------PAGE PORTION------------------
            {
                path: "/page",
                name: "page.index",
                component: () => import("./../views/admin/page/index"),
            },
            {
                path: "/page/create",
                name: "page.create",
                component: () => import("./../views/admin/page/create"),
            },
            {
                path: "/page/:id",
                name: "page.show",
                component: () => import("./../views/admin/page/view"),
            },
            {
                path: "/page/:id/edit",
                name: "page.edit",
                component: () => import("./../views/admin/page/create"),
            },

            // ------------------PAGESEO PORTION------------------
            {
                path: "/pageSeo",
                name: "pageSeo.index",
                component: () => import("./../views/admin/pageSeo/index"),
            },
            {
                path: "/pageSeo/create",
                name: "pageSeo.create",
                component: () => import("./../views/admin/pageSeo/create"),
            },
            {
                path: "/pageSeo/:id",
                name: "pageSeo.show",
                component: () => import("./../views/admin/pageSeo/view"),
            },
            {
                path: "/pageSeo/:id/edit",
                name: "pageSeo.edit",
                component: () => import("./../views/admin/pageSeo/create"),
            },

            // ------------------PageSection PORTION------------------
            {
                path: "/pageSection",
                name: "pageSection.index",
                component: () => import("./../views/admin/pageSection/index"),
            },
            {
                path: "/pageSection/create",
                name: "pageSection.create",
                component: () => import("./../views/admin/pageSection/create"),
            },
            {
                path: "/pageSection/:id",
                name: "pageSection.show",
                component: () => import("./../views/admin/pageSection/view"),
            },
            {
                path: "/pageSection/:id/edit",
                name: "pageSection.edit",
                component: () => import("./../views/admin/pageSection/create"),
            },

            // ------------------FAQ PORTION------------------
            {
                path: "/faq",
                name: "faq.index",
                component: () => import("./../views/admin/faq/index"),
            },
            {
                path: "/faq/create",
                name: "faq.create",
                component: () => import("./../views/admin/faq/create"),
            },
            {
                path: "/faq/:id",
                name: "faq.show",
                component: () => import("./../views/admin/faq/view"),
            },
            {
                path: "/faq/:id/edit",
                name: "faq.edit",
                component: () => import("./../views/admin/faq/create"),
            },

            // ------------------CONTACTS PORTION------------------
            {
                path: "/contacts",
                name: "contacts.index",
                component: () => import("./../views/admin/contacts/index"),
            },
            {
                path: "/contacts/create",
                name: "contacts.create",
                component: () => import("./../views/admin/contacts/create"),
            },
            {
                path: "/contacts/:id",
                name: "contacts.show",
                component: () => import("./../views/admin/contacts/view"),
            },
            {
                path: "/contacts/:id/edit",
                name: "contacts.edit",
                component: () => import("./../views/admin/contacts/create"),
            },

            // ------------------CATEGORY PORTION------------------
            {
                path: "/category",
                name: "category.index",
                component: () => import("./../views/admin/category/index"),
            },
            {
                path: "/category/create",
                name: "category.create",
                component: () => import("./../views/admin/category/create"),
            },
            {
                path: "/category/:id",
                name: "category.show",
                component: () => import("./../views/admin/category/view"),
            },
            {
                path: "/category/:id/edit",
                name: "category.edit",
                component: () => import("./../views/admin/category/create"),
            },

            // ------------------PLUGIN PORTION------------------
            // {
            //     path: "/plugin",
            //     name: "plugin.index",
            //     component: () => import("./../views/admin/plugin/index"),
            // },
            // {
            //     path: "/plugin/create",
            //     name: "plugin.create",
            //     component: () => import("./../views/admin/plugin/create"),
            // },
            // {
            //     path: "/plugin/:id",
            //     name: "plugin.show",
            //     component: () => import("./../views/admin/plugin/view"),
            // },
            // {
            //     path: "/plugin/:id/edit",
            //     name: "plugin.edit",
            //     component: () => import("./../views/admin/plugin/create"),
            // },

            {
                path: "/searchData",
                name: "searchData.index",
                component: () => import("./../views/admin/XMLData"),
            },
            {
                path: "/robots",
                name: "robots.index",
                component: () => import("./../views/admin/robots"),
            },

            // ------------------mediaValidator PORTION------------------
            {
                path: "/mediaValidator",
                name: "mediaValidator.index",
                component: () =>
                    import("./../views/admin/mediaValidator/index"),
            },
            {
                path: "/mediaValidator/create",
                name: "mediaValidator.create",
                component: () =>
                    import("./../views/admin/mediaValidator/create"),
            },
            {
                path: "/mediaValidator/:id",
                name: "mediaValidator.show",
                component: () => import("./../views/admin/mediaValidator/view"),
            },
            {
                path: "/mediaValidator/:id/edit",
                name: "mediaValidator.edit",
                component: () =>
                    import("./../views/admin/mediaValidator/create"),
            },
            // ------------------HelpInfo PORTION------------------
            {
                path: "/helpInfo",
                name: "helpInfo.index",
                component: () => import("./../views/admin/helpInfo/index"),
            },
            {
                path: "/helpInfo/create",
                name: "helpInfo.create",
                component: () => import("./../views/admin/helpInfo/create"),
            },
            {
                path: "/helpInfo/:id",
                name: "helpInfo.show",
                component: () => import("./../views/admin/helpInfo/view"),
            },
            {
                path: "/helpInfo/:id/edit",
                name: "helpInfo.edit",
                component: () => import("./../views/admin/helpInfo/create"),
            },

            // ------------------Theme PORTION------------------
            {
                path: "/theme",
                name: "theme.index",
                component: () => import("./../views/admin/theme/index"),
            },
            {
                path: "/theme/create",
                name: "theme.create",
                component: () => import("./../views/admin/theme/create"),
            },
            {
                path: "/theme/:id",
                name: "theme.show",
                component: () => import("./../views/admin/theme/view"),
            },
            {
                path: "/theme/:id/edit",
                name: "theme.edit",
                component: () => import("./../views/admin/theme/create"),
            },

            // ------------------Service PORTION------------------
            {
                path: "/service",
                name: "service.index",
                component: () => import("./../views/admin/service/index"),
            },
            {
                path: "/service/create",
                name: "service.create",
                component: () => import("./../views/admin/service/create"),
            },
            {
                path: "/service/:id",
                name: "service.show",
                component: () => import("./../views/admin/service/view"),
            },
            {
                path: "/service/:id/edit",
                name: "service.edit",
                component: () => import("./../views/admin/service/create"),
            },

            // ------------------Testimonial PORTION------------------
            {
                path: "/testimonial",
                name: "testimonial.index",
                component: () => import("./../views/admin/testimonial/index"),
            },
            {
                path: "/testimonial/create",
                name: "testimonial.create",
                component: () => import("./../views/admin/testimonial/create"),
            },
            {
                path: "/testimonial/:id",
                name: "testimonial.show",
                component: () => import("./../views/admin/testimonial/view"),
            },
            {
                path: "/testimonial/:id/edit",
                name: "testimonial.edit",
                component: () => import("./../views/admin/testimonial/create"),
            },

            // ------------------Organization PORTION------------------
            {
                path: "/organization",
                name: "organization.index",
                component: () => import("./../views/admin/organization/index"),
            },
            {
                path: "/organization/create",
                name: "organization.create",
                component: () => import("./../views/admin/organization/create"),
            },
            {
                path: "/organization/:id",
                name: "organization.show",
                component: () => import("./../views/admin/organization/view"),
            },
            {
                path: "/organization/:id/edit",
                name: "organization.edit",
                component: () => import("./../views/admin/organization/create"),
            },
            // ------------------Package PORTION------------------
            {
                path: "/package",
                name: "package.index",
                component: () => import("./../views/admin/package/index"),
            },
            {
                path: "/package/create",
                name: "package.create",
                component: () => import("./../views/admin/package/create"),
            },
            {
                path: "/package/:id",
                name: "package.show",
                component: () => import("./../views/admin/package/view"),
            },
            {
                path: "/package/:id/edit",
                name: "package.edit",
                component: () => import("./../views/admin/package/create"),
            },
            // ------------------Invoice PORTION------------------
            {
                path: "/invoice",
                name: "invoice.index",
                component: () => import("./../views/admin/invoice/index"),
            },
            {
                path: "/invoice/create",
                name: "invoice.create",
                component: () => import("./../views/admin/invoice/create"),
            },
            {
                path: "/invoice/:id",
                name: "invoice.show",
                component: () => import("./../views/admin/invoice/view"),
            },
            {
                path: "/invoice/:id/edit",
                name: "invoice.edit",
                component: () => import("./../views/admin/invoice/create"),
            },
            {
                path: "/invoice/bill/:id",
                name: "invoice.bill",
                component: () => import("./../views/admin/invoice/bill"),
            },
            {
                path: "/invoice/moneyreceipt/:id",
                name: "invoice.moneyreceipt",
                component: () =>
                    import("./../views/admin/invoice/moneyreceipt"),
            },
            // ------------------AccountHead PORTION------------------
            {
                path: "/accountHead",
                name: "accountHead.index",
                component: () => import("./../views/admin/accountHead/index"),
            },
            {
                path: "/accountHead/create",
                name: "accountHead.create",
                component: () => import("./../views/admin/accountHead/create"),
            },
            {
                path: "/accountHead/:id",
                name: "accountHead.show",
                component: () => import("./../views/admin/accountHead/view"),
            },
            {
                path: "/accountHead/:id/edit",
                name: "accountHead.edit",
                component: () => import("./../views/admin/accountHead/create"),
            },
            // ------------------Feature PORTION------------------
            {
                path: "/feature",
                name: "feature.index",
                component: () => import("./../views/admin/feature/index"),
            },
            {
                path: "/feature/create",
                name: "feature.create",
                component: () => import("./../views/admin/feature/create"),
            },
            {
                path: "/feature/:id",
                name: "feature.show",
                component: () => import("./../views/admin/feature/view"),
            },
            {
                path: "/feature/:id/edit",
                name: "feature.edit",
                component: () => import("./../views/admin/feature/create"),
            },
            // ------------------PromoCode PORTION------------------
            {
                path: "/promoCode",
                name: "promoCode.index",
                component: () => import("./../views/admin/promoCode/index"),
            },
            {
                path: "/promoCode/create",
                name: "promoCode.create",
                component: () => import("./../views/admin/promoCode/create"),
            },
            {
                path: "/promoCode/:id",
                name: "promoCode.show",
                component: () => import("./../views/admin/promoCode/view"),
            },
            {
                path: "/promoCode/:id/edit",
                name: "promoCode.edit",
                component: () => import("./../views/admin/promoCode/create"),
            },
            // ------------------Product PORTION------------------
            {
                path: "/product",
                name: "product.index",
                component: () => import("./../views/admin/product/index"),
            },
            {
                path: "/product/create",
                name: "product.create",
                component: () => import("./../views/admin/product/create"),
            },
            {
                path: "/product/:id",
                name: "product.show",
                component: () => import("./../views/admin/product/view"),
            },
            {
                path: "/product/:id/edit",
                name: "product.edit",
                component: () => import("./../views/admin/product/create"),
            },
            {
                path: "/project",
                name: "project.index",
                component: () => import("./../views/admin/product/index"),
            },
            {
                path: "/project/create",
                name: "project.create",
                component: () => import("./../views/admin/product/create"),
            },
            {
                path: "/project/:id",
                name: "project.show",
                component: () => import("./../views/admin/product/view"),
            },
            {
                path: "/project/:id/edit",
                name: "project.edit",
                component: () => import("./../views/admin/product/create"),
            },
            // ------------------Template PORTION------------------
            {
                path: "/template",
                name: "template.index",
                component: () => import("./../views/admin/template/index"),
            },
            {
                path: "/template/create",
                name: "template.create",
                component: () => import("./../views/admin/template/create"),
            },
            {
                path: "/template/:id",
                name: "template.show",
                component: () => import("./../views/admin/template/view"),
            },
            {
                path: "/template/:id/edit",
                name: "template.edit",
                component: () => import("./../views/admin/template/create"),
            },
            // ------------------EmailHistory PORTION------------------
            {
                path: "/emailHistory",
                name: "emailHistory.index",
                component: () => import("./../views/admin/emailHistory/index"),
            },
            {
                path: "/emailHistory/create",
                name: "emailHistory.create",
                component: () => import("./../views/admin/emailHistory/create"),
            },
            {
                path: "/emailHistory/:id",
                name: "emailHistory.show",
                component: () => import("./../views/admin/emailHistory/view"),
            },
            {
                path: "/emailHistory/:id/edit",
                name: "emailHistory.edit",
                component: () => import("./../views/admin/emailHistory/create"),
            },
        ],
    },
];

// Check Authentication...
function checkAuth(to, from, next) {
    let role = localStorage.getItem("role");
    let user = localStorage.getItem("user");
    if (role && user) {
        next();
    } else {
        window.location.href = "/";
    }
}

// Initialize Router..
const router = createRouter({
    history: createWebHistory(process.env.MIX_VUE_ROUTER_BASE + "/admin/"),
    scrollBehavior() {
        document.getElementById("app").scrollIntoView({
            behavior: "smooth",
        });
    },

    linkExactActiveClass: "active",
    routes,
});

export default router;
