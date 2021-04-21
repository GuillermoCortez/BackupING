// IMPLEMENTACIÓN DEL MÉTODO DE LA FALSA POSICIÓN PARA LA RESOLUCIÓN DE UNA ECUACIÓN DE UNA VARIABLE
// Siguiendo Ejemplo 5.1 de Chapman

clear
clc

// Criterios de parada
tol = 0.001 // tolerancia del error relativo
Nmax = 20 // Máximo número de iteraciones

deff('y = f(x)', 'y = x.^2 - 5*x - 30') 

deff('y = df(x)', 'y = 2*x - 5')

xg=0:1:10
yg = f(xg)
plot(xg,yg)

x0=7

xn=[x0]
fn=[]
dfn=[]

for iter=1:Nmax,
    fn=[fn,f(xn($))]
    dfn=[dfn, df(xn($))]
    xn = [xn, xn($)-fn($)/dfn($)]
    er = abs((xn($-1)-xn($))/xn($))
    disp(string(xn($)))
    disp('iteración '+string(iter)+': X_aprox ='+string(xn($))+'; er ='+string(er))
    if er <= tol then
        disp('La solución de la ecuación f(x)=0 es x='+string(xn($)))
        disp('Y el error relativo aproximado es er='+string(er))
        break
    end
end
disp(string(xn($)))
plot(xn,'ro-.')
