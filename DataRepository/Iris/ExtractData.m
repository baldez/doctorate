function[Data metaData textScanParam] = ExtractData(fileName)
% [numAttributes nameAttributes typeAttributes] = ReadData(fileName)
%       Extrai do arquivo ARFF informa��es de quantidade, nome e tipo
%       dos atributos. A partir desses metadados obter os dados

%->adequar a leitura do arquivo as extens�es. 
% Coloca ARFF se n�o tiver.
if (length(fileName) <= 4) || ~strcmpi(fileName(end-4:end),'.ARFF')
    fileName = strcat(fileName,'.ARFF');
end

METAFILE = fileread(fileName);
regExp1 = '# Instances:\d*?\s';
[idxStart idxEnd] = regexpi(METAFILE,regExp1);
metaData.numInstances = str2double(METAFILE(idxStart+12:idxEnd));

regExp1 = '# Attributes:\d*?\s';
[idxStart idxEnd] = regexpi(METAFILE,regExp1);
metaData.numAttributes = str2double(METAFILE(idxStart+13:idxEnd));

regExp1 = '# class:\d*?\s';
[idxStart idxEnd] = regexpi(METAFILE,regExp1);
metaData.numClass = str2double(METAFILE(idxStart+8:idxEnd));

regExp2 = '@ATTRIBUTE\s.*?\r';
[idxStart idxEnd] = regexpi(METAFILE,regExp2);
for i=1:metaData.numAttributes
    rangeAux = idxStart(i)+11:idxEnd(i);
    auxLine = METAFILE(rangeAux);
    splitPoint = regexpi(auxLine,'\s');
    metaData.nameAttributes{i} = strtrim(auxLine(1:splitPoint-1));
    metaData.typeAttributes{i} = strtrim(auxLine(splitPoint+1:end));
end
%->Modificar os not Numeric/Real para String, ou seja, trocar f por s
% nas posi��es cujo o tipo � diferente de Numeric/Real

%Cria a string que ser� usada na entrada do TEXTSCAN
textScanParam(1:3*metaData.numAttributes) = '%';
textScanParam(2:3:3*metaData.numAttributes) = 'f';
textScanParam(3:3:3*metaData.numAttributes) = ' ';
textScanParam = strcat(textScanParam, ' %s %*[\r]');

for i=1:metaData.numAttributes
    if ~(strcmpi(metaData.typeAttributes{i},'NUMERIC') || ...
            strcmpi(metaData.typeAttributes{i},'REAL'))
        textScanParam(3*i-1) = 's';
    end
end

%Extrai em Data, os dados do arquivo csv, em acordo com o 
%tipo espec�ficado em textScanParam
fileName = strcat(fileName(1:end-4),'CSV');
fid = fopen(fileName);
Data = textscan(fid,textScanParam,'delimiter',',');
fclose(fid);

% %problemas de erros de incoer�ncia
% for i=1:metaData.numInstances
%     if (length(Data{i}) ~= metaData.numInstances)
%         error('myApp:validation', 'incoer�ncia entre o n�mero de inst�ncias do metadado e a dimens�o dos dados extra�dos.')
%     end
% end
end