import { Router } from "express";
import db from "./db.js";
import queries from "./queries.js";

const router = Router();

router.get("/:name", async(req,res)=>{

    const sql = queries[req.params.name];
    console.log(sql);
    
    if(!sql){
        return res.status(404).json({
            message:"Reporte no encontrado"
        });
    }

    const result = await db.query(sql);

    res.json(result.rows);

});

export default router;