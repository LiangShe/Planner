function fmri_svbvolume(vol,stem,voldim,ext)
% fmri_ldbvolume(vol,stem,voldim,ext)
%
% Saves a volume in bfile format where vol is a 4D structure
% of dimension Nslices X Nrows X Ncols X Ndepth.
%
% '$Id: fmri_svbvolume.m,v 1.1 2003/03/04 20:47:40 greve Exp $'

if(nargin ~= 2 & nargin ~= 3 & nargin ~= 4)    
  fprintf(2,'USAGE: fmri_svbvolume(vol,stem,<voldim>,<ext>)\n');
  qoe; error; return;
end

if(nargin > 2)  
  if(~isempty(voldim))  
    vol = reshape(vol, voldim); 
  else
    voldim = size(vol);
  end
else
  voldim = size(vol);
end

if(nargin ~= 4)  ext = 'bfloat'; end

nslices = voldim(1);
for slice = 0:nslices-1
  % fprintf('Saving Slice %3d\n',slice);
  fname = sprintf('%s_%03d.%s',stem,slice,ext);
  z = shiftdim(vol(slice+1,:,:,:),1);
  fmri_svbfile(z, fname);
end

return;
