Ç
îĂ
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
H
ShardedFilename
basename	
shard

num_shards
filename
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.13.12v1.13.1-0-g6612da89518ľw

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
k
global_step
VariableV2*
dtype0	*
_output_shapes
: *
shape: *
_class
loc:@global_step

global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
_output_shapes
: *
T0	*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
n
mu_selectedPlaceholder*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙
j
mu_leftPlaceholder*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙
g
mu_vPlaceholder*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙

-dense/kernel/Initializer/random_uniform/shapeConst*
valueB"      *
_class
loc:@dense/kernel*
dtype0*
_output_shapes
:

+dense/kernel/Initializer/random_uniform/minConst*
valueB 2.!	óż*
_class
loc:@dense/kernel*
dtype0*
_output_shapes
: 

+dense/kernel/Initializer/random_uniform/maxConst*
valueB 2.!	ó?*
_class
loc:@dense/kernel*
dtype0*
_output_shapes
: 
Ě
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*
T0*
_class
loc:@dense/kernel
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
ŕ
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel*
_output_shapes

:
Ň
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
_output_shapes

:*
T0*
_class
loc:@dense/kernel
}
dense/kernel
VariableV2*
shape
:*
_class
loc:@dense/kernel*
dtype0*
_output_shapes

:

dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
T0*
_class
loc:@dense/kernel*
_output_shapes

:
u
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel*
_output_shapes

:

dense/bias/Initializer/zerosConst*
valueB2        *
_class
loc:@dense/bias*
dtype0*
_output_shapes
:
q

dense/bias
VariableV2*
dtype0*
_output_shapes
:*
shape:*
_class
loc:@dense/bias

dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
T0*
_class
loc:@dense/bias*
_output_shapes
:
k
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias*
_output_shapes
:
h
dense/MatMulMatMulmu_selecteddense/kernel/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
i
dense/BiasAddBiasAdddense/MatMuldense/bias/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
Ł
/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"      *!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
:

-dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB 2.!	óż*!
_class
loc:@dense_1/kernel

-dense_1/kernel/Initializer/random_uniform/maxConst*
valueB 2.!	ó?*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
: 
Ň
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*
T0*!
_class
loc:@dense_1/kernel
Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
č
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes

:
Ú
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes

:

dense_1/kernel
VariableV2*
shape
:*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes

:
Ś
dense_1/kernel/AssignAssigndense_1/kernel)dense_1/kernel/Initializer/random_uniform*
_output_shapes

:*
T0*!
_class
loc:@dense_1/kernel
{
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes

:

dense_1/bias/Initializer/zerosConst*
valueB2        *
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:
u
dense_1/bias
VariableV2*
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:*
shape:

dense_1/bias/AssignAssigndense_1/biasdense_1/bias/Initializer/zeros*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:
q
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:
h
dense_1/MatMulMatMulmu_leftdense_1/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_2/kernel/Initializer/random_uniform/shapeConst*
valueB"      *!
_class
loc:@dense_2/kernel*
dtype0*
_output_shapes
:

-dense_2/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB 2.!	óż*!
_class
loc:@dense_2/kernel

-dense_2/kernel/Initializer/random_uniform/maxConst*
valueB 2.!	ó?*!
_class
loc:@dense_2/kernel*
dtype0*
_output_shapes
: 
Ň
7dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_2/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_2/kernel*
dtype0*
_output_shapes

:
Ö
-dense_2/kernel/Initializer/random_uniform/subSub-dense_2/kernel/Initializer/random_uniform/max-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel*
_output_shapes
: 
č
-dense_2/kernel/Initializer/random_uniform/mulMul7dense_2/kernel/Initializer/random_uniform/RandomUniform-dense_2/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_2/kernel*
_output_shapes

:
Ú
)dense_2/kernel/Initializer/random_uniformAdd-dense_2/kernel/Initializer/random_uniform/mul-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel*
_output_shapes

:

dense_2/kernel
VariableV2*!
_class
loc:@dense_2/kernel*
dtype0*
_output_shapes

:*
shape
:
Ś
dense_2/kernel/AssignAssigndense_2/kernel)dense_2/kernel/Initializer/random_uniform*
T0*!
_class
loc:@dense_2/kernel*
_output_shapes

:
{
dense_2/kernel/readIdentitydense_2/kernel*
T0*!
_class
loc:@dense_2/kernel*
_output_shapes

:

dense_2/bias/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB2        *
_class
loc:@dense_2/bias
u
dense_2/bias
VariableV2*
_class
loc:@dense_2/bias*
dtype0*
_output_shapes
:*
shape:

dense_2/bias/AssignAssigndense_2/biasdense_2/bias/Initializer/zeros*
_output_shapes
:*
T0*
_class
loc:@dense_2/bias
q
dense_2/bias/readIdentitydense_2/bias*
T0*
_class
loc:@dense_2/bias*
_output_shapes
:
e
dense_2/MatMulMatMulmu_vdense_2/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dense_2/BiasAddBiasAdddense_2/MatMuldense_2/bias/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
M
concat/axisConst*
dtype0*
_output_shapes
: *
value	B :

concatConcatV2dense/BiasAdddense_1/BiasAdddense_2/BiasAddconcat/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_3/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"      *!
_class
loc:@dense_3/kernel

-dense_3/kernel/Initializer/random_uniform/minConst*
valueB 2PyQ íż*!
_class
loc:@dense_3/kernel*
dtype0*
_output_shapes
: 

-dense_3/kernel/Initializer/random_uniform/maxConst*
valueB 2PyQ í?*!
_class
loc:@dense_3/kernel*
dtype0*
_output_shapes
: 
Ň
7dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_3/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_3/kernel*
dtype0*
_output_shapes

:
Ö
-dense_3/kernel/Initializer/random_uniform/subSub-dense_3/kernel/Initializer/random_uniform/max-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes
: 
č
-dense_3/kernel/Initializer/random_uniform/mulMul7dense_3/kernel/Initializer/random_uniform/RandomUniform-dense_3/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes

:
Ú
)dense_3/kernel/Initializer/random_uniformAdd-dense_3/kernel/Initializer/random_uniform/mul-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes

:

dense_3/kernel
VariableV2*
dtype0*
_output_shapes

:*
shape
:*!
_class
loc:@dense_3/kernel
Ś
dense_3/kernel/AssignAssigndense_3/kernel)dense_3/kernel/Initializer/random_uniform*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes

:
{
dense_3/kernel/readIdentitydense_3/kernel*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes

:

dense_3/bias/Initializer/zerosConst*
valueB2        *
_class
loc:@dense_3/bias*
dtype0*
_output_shapes
:
u
dense_3/bias
VariableV2*
shape:*
_class
loc:@dense_3/bias*
dtype0*
_output_shapes
:

dense_3/bias/AssignAssigndense_3/biasdense_3/bias/Initializer/zeros*
T0*
_class
loc:@dense_3/bias*
_output_shapes
:
q
dense_3/bias/readIdentitydense_3/bias*
T0*
_class
loc:@dense_3/bias*
_output_shapes
:
g
dense_3/MatMulMatMulconcatdense_3/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dense_3/BiasAddBiasAdddense_3/MatMuldense_3/bias/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_ef135ad5e0524a1f86e56def8d1688b8/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
ň
save/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:	*
valueB	B
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBdense_2/biasBdense_2/kernelBdense_3/biasBdense_3/kernelBglobal_step

save/SaveV2/shape_and_slicesConst"/device:CPU:0*%
valueB	B B B B B B B B B *
dtype0*
_output_shapes
:	

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices
dense/biasdense/kerneldense_1/biasdense_1/kerneldense_2/biasdense_2/kerneldense_3/biasdense_3/kernelglobal_step"/device:CPU:0*
dtypes
2		
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*'
_class
loc:@save/ShardedFilename
 
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*
N*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
ő
save/RestoreV2/tensor_namesConst"/device:CPU:0*
valueB	B
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBdense_2/biasBdense_2/kernelBdense_3/biasBdense_3/kernelBglobal_step*
dtype0*
_output_shapes
:	

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*%
valueB	B B B B B B B B B *
dtype0*
_output_shapes
:	
Ç
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*8
_output_shapes&
$:::::::::*
dtypes
2		
u
save/AssignAssign
dense/biassave/RestoreV2*
T0*
_class
loc:@dense/bias*
_output_shapes
:

save/Assign_1Assigndense/kernelsave/RestoreV2:1*
T0*
_class
loc:@dense/kernel*
_output_shapes

:
}
save/Assign_2Assigndense_1/biassave/RestoreV2:2*
_output_shapes
:*
T0*
_class
loc:@dense_1/bias

save/Assign_3Assigndense_1/kernelsave/RestoreV2:3*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes

:
}
save/Assign_4Assigndense_2/biassave/RestoreV2:4*
T0*
_class
loc:@dense_2/bias*
_output_shapes
:

save/Assign_5Assigndense_2/kernelsave/RestoreV2:5*
_output_shapes

:*
T0*!
_class
loc:@dense_2/kernel
}
save/Assign_6Assigndense_3/biassave/RestoreV2:6*
_output_shapes
:*
T0*
_class
loc:@dense_3/bias

save/Assign_7Assigndense_3/kernelsave/RestoreV2:7*
_output_shapes

:*
T0*!
_class
loc:@dense_3/kernel
w
save/Assign_8Assignglobal_stepsave/RestoreV2:8*
T0	*
_class
loc:@global_step*
_output_shapes
: 
¨
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"Ď
trainable_variablesˇ´
g
dense/kernel:0dense/kernel/Assigndense/kernel/read:02)dense/kernel/Initializer/random_uniform:08
V
dense/bias:0dense/bias/Assigndense/bias/read:02dense/bias/Initializer/zeros:08
o
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02+dense_1/kernel/Initializer/random_uniform:08
^
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02 dense_1/bias/Initializer/zeros:08
o
dense_2/kernel:0dense_2/kernel/Assigndense_2/kernel/read:02+dense_2/kernel/Initializer/random_uniform:08
^
dense_2/bias:0dense_2/bias/Assigndense_2/bias/read:02 dense_2/bias/Initializer/zeros:08
o
dense_3/kernel:0dense_3/kernel/Assigndense_3/kernel/read:02+dense_3/kernel/Initializer/random_uniform:08
^
dense_3/bias:0dense_3/bias/Assigndense_3/bias/read:02 dense_3/bias/Initializer/zeros:08"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"
	variables
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
g
dense/kernel:0dense/kernel/Assigndense/kernel/read:02)dense/kernel/Initializer/random_uniform:08
V
dense/bias:0dense/bias/Assigndense/bias/read:02dense/bias/Initializer/zeros:08
o
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02+dense_1/kernel/Initializer/random_uniform:08
^
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02 dense_1/bias/Initializer/zeros:08
o
dense_2/kernel:0dense_2/kernel/Assigndense_2/kernel/read:02+dense_2/kernel/Initializer/random_uniform:08
^
dense_2/bias:0dense_2/bias/Assigndense_2/bias/read:02 dense_2/bias/Initializer/zeros:08
o
dense_3/kernel:0dense_3/kernel/Assigndense_3/kernel/read:02+dense_3/kernel/Initializer/random_uniform:08
^
dense_3/bias:0dense_3/bias/Assigndense_3/bias/read:02 dense_3/bias/Initializer/zeros:08"%
saved_model_main_op


group_deps*í
serving_defaultŮ
+
mu_left 
	mu_left:0˙˙˙˙˙˙˙˙˙
3
mu_selected$
mu_selected:0˙˙˙˙˙˙˙˙˙
%
mu_v
mu_v:0˙˙˙˙˙˙˙˙˙2
output(
dense_3/BiasAdd:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict*ĺ
predictŮ
%
mu_v
mu_v:0˙˙˙˙˙˙˙˙˙
+
mu_left 
	mu_left:0˙˙˙˙˙˙˙˙˙
3
mu_selected$
mu_selected:0˙˙˙˙˙˙˙˙˙2
output(
dense_3/BiasAdd:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict