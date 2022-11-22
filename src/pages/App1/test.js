import React, { useReducer, useEffect } from "react";
function Counter() {
    const [state, dispatch] = useReducer(reducer1, { count: 100, age: 200 })

    useEffect(() => {
        dispatch({ "type1": "changeCount" })
    }, [dispatch]);

    function reducer1(state, action) {
        if (action.type1 === "changeCount") {
            return {
                ...state,
                count: state.count + 900
            }
        }
    }

    return (
        <>
            <h1>{state.count}</h1>
            <h1>{state.age}</h1>
        </>
    );


}


export default Counter;
