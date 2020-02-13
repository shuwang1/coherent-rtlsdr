clear all;
close all;

sdr = CZMQSDR('IPAddress','127.0.0.1');
FESR = 1e6; % 2048000;
scope = dsp.SpectrumAnalyzer(...
    'Name',             'Spectrum',...
    'Title',            'Spectrum', ...
    'SpectrumType',     'Power',...
    'FrequencySpan',    'Full', ...
    'SampleRate',        FESR, ...
    'YLimits',          [-50,5],...
    'SpectralAverages', 50, ...
    'FrequencySpan',    'Start and stop frequencies', ...
    'StartFrequency',   -FESR/2, ...
    'StopFrequency',    FESR/2);

while(1)
    [x,gseq,seq]=sdr();
    scope(x(:,2:end)); %ch 1 is reference, exclude it
end