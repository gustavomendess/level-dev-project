import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Posts from './components/Posts.vue'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'posts',
        component: Posts
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router