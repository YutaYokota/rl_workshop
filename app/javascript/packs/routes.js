import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import routes from './list';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
  routes: routes
});

export default router;
