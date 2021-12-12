export default {
    state: {
       loader: false
    },
    getters: {
        getLoader(state) {
            return state.loader;
        }
    },
    mutations: {
        updateShowLoader(state, ifShow) {
            state.loader = ifShow;
        }
    },
    actions: {
        changeShowLoader({ commit }, ifShow) {
            commit("updateShowLoader", ifShow)
        }
    }
}