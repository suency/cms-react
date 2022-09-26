const DynComp = ({ Obj, name }) => {
  const ObjComponent = Obj[name]

  if (!ObjComponent) { // Return a default one
    return <Obj.SolutionOutlined />
  }

  return <ObjComponent />
}

export default DynComp