function loadRoute(name) {
  return () => import(`pages/${name}`)
}

export default [
  { path: '', component: '', name: '' },
]
