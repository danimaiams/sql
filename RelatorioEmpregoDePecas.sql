/*******************************************************************************
* Aplicativo:  VS Factory
* Modulo:      Dw_QT_EmpregoPecas.rdl
*******************************************************************************/

select pla.DSC_ACO,
       sum(case when res.cod_ordem_producao like 'LQX%' then 1 else 0 end) as lqx,
       sum(case when res.cod_ordem_producao like 'LQP%' then 1 else 0 end) as lqp,
       sum(case when res.cod_ordem_producao like 'LQT%' then 1 else 0 end) as LQT,
       sum(case when res.cod_ordem_producao like 'LQRT%' then 1 else 0 end) as lqrt,
       sum(case when res.cod_ordem_producao like 'LQRZ%' then 1 else 0 end) as lqrz,
       sum(case when res.cod_ordem_producao like 'LQZ%' then 1 else 0 end) as LQZ,
       sum(case when res.cod_ordem_producao like 'LQRW%' then 1 else 0 end) as lqrw,
       sum(case when res.cod_ordem_producao like 'LQW%' then 1 else 0 end) as LQW,
       sum(case when res.cod_ordem_producao like 'LQ0%' then 1 else 0 end) as Lq0,
       sum(case when res.cod_ordem_producao like 'LQR0%' then 1 else 0 end) as LQR0
from QT_QTS.RES_TUBO_REVENIMENTO2 res, QT_QTS.PLA_ORDEM_PRODUCAO pla
where res.COD_ORDEM_PRODUCAO = pla.COD_ORDEM_PRODUCAO
	  and res.DTH_ENFORNAMENTO >= :dthini 
	  and res.DTH_ENFORNAMENTO <=:dthfim
group by pla.DSC_ACO

UNION ALL
SELECT 
'TOTAL GERAL' DSC,
SUM(lqx),
SUM(lqp),
SUM(LQT),
SUM(lqrt),
SUM(lqz),
SUM(LQZ),
SUM(lqrw),
SUM(LQW),
SUM(Lq0),
SUM(LQR0)
FROM (select pla.DSC_ACO,
       sum(case when res.cod_ordem_producao like 'LQX%' then 1 else 0 end) as lqx,
       sum(case when res.cod_ordem_producao like 'LQP%' then 1 else 0 end) as lqp,
       sum(case when res.cod_ordem_producao like 'LQT%' then 1 else 0 end) as LQT,
       sum(case when res.cod_ordem_producao like 'LQRT%' then 1 else 0 end) as lqrt,
       sum(case when res.cod_ordem_producao like 'LQRZ%' then 1 else 0 end) as lqrz,
       sum(case when res.cod_ordem_producao like 'LQZ%' then 1 else 0 end) as LQZ,
       sum(case when res.cod_ordem_producao like 'LQRW%' then 1 else 0 end) as lqrw,
       sum(case when res.cod_ordem_producao like 'LQW%' then 1 else 0 end) as LQW,
       sum(case when res.cod_ordem_producao like 'LQ0%' then 1 else 0 end) as Lq0,
       sum(case when res.cod_ordem_producao like 'LQR0%' then 1 else 0 end) as LQR0
from QT_QTS.RES_TUBO_REVENIMENTO2 res, QT_QTS.PLA_ORDEM_PRODUCAO pla
where res.COD_ORDEM_PRODUCAO = pla.COD_ORDEM_PRODUCAO
	  and res.DTH_ENFORNAMENTO >= :dthini 
	  and res.DTH_ENFORNAMENTO <=:dthfim
group by pla.DSC_ACO)