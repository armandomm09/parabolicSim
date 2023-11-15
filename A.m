% Parámetros iniciales
g = 9.81; % Aceleración debida a la gravedad (m/s^2)
rho = 1.2; % Densidad del aire (kg/m^3)
k = 0.05; % Coeficiente de resistencia del objeto
m = 2; % Área de sección transversal del objeto (m^2)

% Número de proyectiles a simular
num_proyectiles = input("Ingresa el numero de proyectiles: ");

% Solicitar al usuario la altura inicial del volcán
altura_volcan =  3070; %input('Ingrese la altura inicial del volcán (metros): ');

% Crear una figura para la animación
figure;
hold on;
grid on;
xlabel('Distancia (m)');
ylabel('Altura (m)');



for i = 1:num_proyectiles
    % Velocidad inicial aleatoria para cada proyectil (entre 50 y 100 m/s)
    v0 = randi([50, 100]);
    
    % Ángulo de lanzamiento aleatorio (entre 30 y 60 grados)
    thetadeg = randi([40, 140]);
    thetarad =deg2rad(thetadeg);
    
    %Velocidad inicial en Y
    vy0 = v0*sin(thetarad);

    %Velocidad inicial en x
    vx0 = v0*cos(thetarad);

    
    % Tiempo de vuelo máximo supuesto
    tmax = (-vy0 - sqrt(vy0.^2 - (4* (-4.905) * altura_volcan)))/ (2*(-4.905))
   
    % Altura inicial de los proyectiles
    y0 = altura_volcan;
    

    

    % Crear vectores de tiempo y posición
    t = linspace(0, tmax, 100);
    x = v0 * cos(thetarad) * t;
    y = y0 + v0 * sin(thetarad) * t - (0.5 * g * t.^2);
    
    %Vectores con resistencia del aire
    xt = vx0.* (m*g/k+vy0) * (1 - exp(-k*t./m));
    yt = altura_volcan + (m/k)*(m*g/k+vy0)*(1 - exp(-k*t./m))-(m*g*t./k);


    %Limites de la grafica
    xlim([-10000 10000])
    ylim([0 (altura_volcan * 2)])


    % Dibujar la trayectoria de un proyectil  
    comet(xt,yt);
    plot(xt, yt); 

     
   

end

axes('pos',[0.25 0 .5 .6])
hold on 

%title('Trayectorias de Proyectiles');
