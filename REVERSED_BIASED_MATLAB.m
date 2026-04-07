% Zener Diyot DC REVERSED BIASED

% Vin değerini 0'dan 6V'a kadar 0.01'le arttırır
Vin = 0:0.01:6; 

R = 1000; % Direnç değeri 1k Ohm
Vz = 4.7; % Zener kırılma noktası


% Sonuçları kaydeder
V_diyot = zeros(1, length(Vin));
I_diyot = zeros(1, length(Vin));

% Döngü ile her voltaj değeri
for i = 1:length(Vin)
    if Vin(i) < Vz
        % Voltaj 4.7'den küçükse Zener kapalı (akım yok)
        V_diyot(i) = Vin(i);
        I_diyot(i) = 0;
    else
        % Voltaj 4.7'yi geçince Zener açılır ve voltajı sabitler
        V_diyot(i) = Vz;
        % Kalan voltaj direncin üzerine düşer (V = I*R -> I = V/R)
        I_diyot(i) = (Vin(i) - Vz) / R; 
    end
end

% Akımı aşağı yönlü (negatif) gösterdiği için eksi alır
% Miliamper (mA) yapmak için 1000 ile çarpar
I_mA = -I_diyot * 1000;

% Çizim
figure;

% Voltaj
yyaxis left;
plot(Vin, V_diyot, 'g', 'LineWidth', 1.5);
ylabel('Gerilim (V)');
ylim([0 6]);

% Akım
yyaxis right;
plot(Vin, I_mA, 'b', 'LineWidth', 1.5); hold on;
plot(Vin, I_mA, 'r--', 'LineWidth', 1.5); 
ylabel('Akım (mA)');
ylim([-1.5 0.2]);

% Standart grafik ayarları
xlabel('Vin (V)');
title('Zener Diyot DC Sweep');
legend('V(1diode)', 'I(D1)', 'I(VIN)', 'Location', 'southwest');

grid on;