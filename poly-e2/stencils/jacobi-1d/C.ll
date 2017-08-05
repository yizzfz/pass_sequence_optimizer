; ModuleID = 'B.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_jacobi_1d = private constant [21 x i8] c"B.ll:kernel_jacobi_1d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 82762904306, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_jacobi_1d = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_jacobi_1d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3398934233783132561, i64 272318776633, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [61 x i8] c";\00main\01B.ll:init_array\01B.ll:kernel_jacobi_1d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_jacobi_1d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %conv1 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp eq i32 %n, 1
  br i1 %min.iters.check, label %for.body.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %1 = add i64 %pgocount1, 1
  store i64 %1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %2 = and i32 %n, 1
  %n.mod.vf = zext i32 %2 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %scevgep = getelementptr double, double* %A, i64 %wide.trip.count
  %scevgep6 = getelementptr double, double* %B, i64 %wide.trip.count
  %bound0 = icmp ugt double* %scevgep6, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind8 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next9, %vector.body.vector.body_crit_edge ]
  %4 = sitofp <2 x i32> %vec.ind8 to <2 x double>
  %5 = fadd <2 x double> %4, <double 2.000000e+00, double 2.000000e+00>
  %6 = fdiv <2 x double> %5, %broadcast.splat
  %7 = getelementptr inbounds double, double* %A, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %9 = fadd <2 x double> %4, <double 3.000000e+00, double 3.000000e+00>
  %10 = fdiv <2 x double> %9, %broadcast.splat
  %11 = getelementptr inbounds double, double* %B, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> %10, <2 x double>* %12, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next9 = add <2 x i32> %vec.ind8, <i32 2, i32 2>
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %14 = add i64 %pgocount3, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %15 = add i64 %pgocount4, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %cmp.n = icmp eq i32 %2, 0
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body.for.body_crit_edge ], [ %indvars.iv.ph, %for.body.preheader ]
  %16 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %16 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, %conv1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, %conv1
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body.for.body_crit_edge, !llvm.loop !9

for.body.for.body_crit_edge:                      ; preds = %for.body
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %17 = add i64 %pgocount5, 1
  store i64 %17, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body

for.end.loopexit:                                 ; preds = %for.body
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %18 = add i64 %pgocount6, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %19 = add i64 %pgocount7, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp21 = icmp sgt i32 %sub, 1
  br i1 %cmp21, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %tsteps, -1
  %xtraiter96 = and i32 %tsteps, 7
  %lcmp.mod97 = icmp eq i32 %xtraiter96, 0
  br i1 %lcmp.mod97, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol.for.cond1.preheader.prol_crit_edge, %for.cond1.preheader.prol.preheader
  %t.06.prol = phi i32 [ %inc34.prol, %for.cond1.preheader.prol.for.cond1.preheader.prol_crit_edge ], [ 0, %for.cond1.preheader.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond1.preheader.prol.for.cond1.preheader.prol_crit_edge ], [ %xtraiter96, %for.cond1.preheader.prol.preheader ]
  %inc34.prol = add nuw nsw i32 %t.06.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol.for.cond1.preheader.prol_crit_edge, !llvm.loop !10

for.cond1.preheader.prol.for.cond1.preheader.prol_crit_edge: ; preds = %for.cond1.preheader.prol
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 4)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 4)
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 22)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 22)
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.prol.loopexit.unr-lcssa, %for.cond1.preheader.preheader
  %t.06.unr = phi i32 [ 0, %for.cond1.preheader.preheader ], [ %inc34.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %3 = icmp ult i32 %0, 7
  br i1 %3, label %for.end35.loopexit95, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %4 = add i32 %n, -2
  %5 = add i32 %n, -3
  %xtraiter = and i32 %4, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %5, 0
  %xtraiter13 = and i32 %4, 1
  %lcmp.mod14 = icmp eq i32 %xtraiter13, 0
  %7 = icmp eq i32 %5, 0
  %wide.trip.count12.1 = zext i32 %sub to i64
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %wide.trip.count.1 = zext i32 %sub to i64
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 2
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 1
  %8 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep32 = getelementptr double, double* %A, i64 2
  %9 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep35 = getelementptr double, double* %B, i64 -1
  %scevgep38 = getelementptr double, double* %B, i64 3
  %10 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep59 = getelementptr double, double* %B, i64 2
  %11 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep62 = getelementptr double, double* %A, i64 -1
  %scevgep65 = getelementptr double, double* %A, i64 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc33.us, %for.cond1.preheader.us.preheader
  %t.06.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 11)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 11)
  %13 = load double, double* %A, align 8
  %14 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %13, %14
  %15 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %15
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 2, %for.body3.us.prol ], [ 1, %for.cond1.preheader.us ]
  br i1 %6, label %for.body16.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 7)
  %16 = add i64 %pgocount3, 1
  store i64 %16, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 7)
  %17 = sub nsw i64 %10, %indvars.iv.unr.ph
  %18 = lshr i64 %17, 1
  %19 = add nuw i64 %18, 1
  %min.iters.check51 = icmp ult i64 %19, 2
  br i1 %min.iters.check51, label %for.body3.us.preheader94, label %min.iters.checked52

for.body3.us.preheader94:                         ; preds = %middle.block49, %vector.memcheck72, %min.iters.checked52, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck72 ], [ %indvars.iv.unr.ph, %min.iters.checked52 ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ], [ %ind.end77, %middle.block49 ]
  br label %for.body3.us

min.iters.checked52:                              ; preds = %for.body3.us.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 13)
  %20 = add i64 %pgocount4, 1
  store i64 %20, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 13)
  %n.mod.vf53 = and i64 %19, 1
  %n.vec54 = sub i64 %19, %n.mod.vf53
  %cmp.zero55 = icmp eq i64 %n.vec54, 0
  br i1 %cmp.zero55, label %for.body3.us.preheader94, label %vector.memcheck72

vector.memcheck72:                                ; preds = %min.iters.checked52
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 15)
  %21 = add i64 %pgocount5, 1
  store i64 %21, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 15)
  %scevgep57 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %22 = sub nsw i64 %11, %indvars.iv.unr.ph
  %23 = and i64 %22, -2
  %24 = add nsw i64 %indvars.iv.unr.ph, %23
  %scevgep60 = getelementptr double, double* %scevgep59, i64 %24
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %indvars.iv.unr.ph
  %scevgep66 = getelementptr double, double* %scevgep65, i64 %24
  %bound068 = icmp ult double* %scevgep57, %scevgep66
  %bound169 = icmp ult double* %scevgep63, %scevgep60
  %memcheck.conflict71 = and i1 %bound068, %bound169
  %25 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %26 = shl nuw i64 %18, 1
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf53, 1
  %ind.end77 = sub i64 %27, %28
  br i1 %memcheck.conflict71, label %for.body3.us.preheader94, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck72
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48.vector.body48_crit_edge, %vector.body48.preheader
  %index74 = phi i64 [ %index.next75, %vector.body48.vector.body48_crit_edge ], [ 0, %vector.body48.preheader ]
  %29 = shl i64 %index74, 1
  %offset.idx79 = or i64 %indvars.iv.unr.ph, %29
  %30 = add nsw i64 %offset.idx79, -1
  %31 = getelementptr inbounds double, double* %A, i64 %30
  %32 = bitcast double* %31 to <4 x double>*
  %wide.vec83 = load <4 x double>, <4 x double>* %32, align 8, !alias.scope !12
  %strided.vec84 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec85 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %33 = fadd <2 x double> %strided.vec84, %strided.vec85
  %34 = add nuw nsw i64 %offset.idx79, 1
  %35 = getelementptr inbounds double, double* %A, i64 %34
  %36 = getelementptr double, double* %35, i64 -1
  %37 = bitcast double* %36 to <4 x double>*
  %wide.vec86 = load <4 x double>, <4 x double>* %37, align 8, !alias.scope !12
  %strided.vec88 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %38 = fadd <2 x double> %33, %strided.vec88
  %39 = fmul <2 x double> %38, <double 3.333300e-01, double 3.333300e-01>
  %40 = bitcast double* %35 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !12
  %strided.vec91 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <4 x double> %wide.vec86, %wide.vec89
  %42 = shufflevector <4 x double> %41, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %43 = fadd <2 x double> %42, %strided.vec91
  %44 = fmul <2 x double> %43, <double 3.333300e-01, double 3.333300e-01>
  %45 = getelementptr inbounds double, double* %B, i64 %34
  %46 = getelementptr double, double* %45, i64 -1
  %47 = bitcast double* %46 to <4 x double>*
  %interleaved.vec92 = shufflevector <2 x double> %39, <2 x double> %44, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec92, <4 x double>* %47, align 8, !alias.scope !15, !noalias !12
  %index.next75 = add i64 %index74, 2
  %48 = icmp eq i64 %index.next75, %n.vec54
  br i1 %48, label %middle.block49, label %vector.body48.vector.body48_crit_edge, !llvm.loop !17

vector.body48.vector.body48_crit_edge:            ; preds = %vector.body48
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 2)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 2)
  br label %vector.body48

middle.block49:                                   ; preds = %vector.body48
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 18)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 18)
  %cmp.n78 = icmp eq i64 %n.mod.vf53, 0
  br i1 %cmp.n78, label %for.body16.us.preheader, label %for.body3.us.preheader94

for.inc33.us.loopexit:                            ; preds = %for.body16.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body16.us.prol.loopexit.for.inc33.us_crit_edge, %middle.block, %for.inc33.us.loopexit
  %inc34.us = add nuw nsw i32 %t.06.us, 1
  %exitcond = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond, label %for.end35.loopexit, label %for.cond1.preheader.us

for.body16.us:                                    ; preds = %for.body16.us.for.body16.us_crit_edge, %for.body16.us.preheader93
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %for.body16.us.for.body16.us_crit_edge ], [ %indvars.iv9.ph, %for.body16.us.preheader93 ]
  %51 = add nsw i64 %indvars.iv9, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %51
  %52 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv9
  %53 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %52, %53
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next10
  %54 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %54
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv9
  store double %mul27.us, double* %arrayidx29.us, align 8
  %arrayidx19.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv9
  %55 = load double, double* %arrayidx19.us.1, align 8
  %arrayidx21.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next10
  %56 = load double, double* %arrayidx21.us.1, align 8
  %add22.us.1 = fadd double %55, %56
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next10.1
  %57 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %57
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next10
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond.116 = icmp eq i64 %indvars.iv.next10.1, %wide.trip.count12.1
  br i1 %exitcond.116, label %for.inc33.us.loopexit, label %for.body16.us.for.body16.us_crit_edge, !llvm.loop !18

for.body16.us.for.body16.us_crit_edge:            ; preds = %for.body16.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 0)
  %58 = add i64 %pgocount8, 1
  store i64 %58, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 0)
  br label %for.body16.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader94
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader94 ]
  %59 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %59
  %60 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %61 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %60, %61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %62 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %62
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %arrayidx.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %63 = load double, double* %arrayidx.us.1, align 8
  %arrayidx6.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %64 = load double, double* %arrayidx6.us.1, align 8
  %add.us.1 = fadd double %63, %64
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %65 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %65
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.body16.us.preheader.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !19

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 1)
  %66 = add i64 %pgocount9, 1
  store i64 %66, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 1)
  br label %for.body3.us

for.body16.us.preheader.loopexit:                 ; preds = %for.body3.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 9)
  %67 = add i64 %pgocount10, 1
  store i64 %67, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 9)
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %for.body16.us.preheader.loopexit, %middle.block49, %for.body3.us.prol.loopexit
  br i1 %lcmp.mod14, label %for.body16.us.prol.loopexit, label %for.body16.us.prol

for.body16.us.prol:                               ; preds = %for.body16.us.preheader
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 12)
  %68 = add i64 %pgocount11, 1
  store i64 %68, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 12)
  %69 = load double, double* %B, align 8
  %70 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %69, %70
  %71 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %71
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.body16.us.prol.loopexit

for.body16.us.prol.loopexit:                      ; preds = %for.body16.us.prol, %for.body16.us.preheader
  %indvars.iv9.unr.ph = phi i64 [ 2, %for.body16.us.prol ], [ 1, %for.body16.us.preheader ]
  br i1 %7, label %for.body16.us.prol.loopexit.for.inc33.us_crit_edge, label %for.body16.us.preheader28

for.body16.us.prol.loopexit.for.inc33.us_crit_edge: ; preds = %for.body16.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 6)
  %72 = add i64 %pgocount12, 1
  store i64 %72, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 6)
  br label %for.inc33.us

for.body16.us.preheader28:                        ; preds = %for.body16.us.prol.loopexit
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 8)
  %73 = add i64 %pgocount13, 1
  store i64 %73, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 8)
  %74 = sub nsw i64 %8, %indvars.iv9.unr.ph
  %75 = lshr i64 %74, 1
  %76 = add nuw i64 %75, 1
  %min.iters.check = icmp ult i64 %76, 2
  br i1 %min.iters.check, label %for.body16.us.preheader93, label %min.iters.checked

for.body16.us.preheader93:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.us.preheader28
  %indvars.iv9.ph = phi i64 [ %indvars.iv9.unr.ph, %vector.memcheck ], [ %indvars.iv9.unr.ph, %min.iters.checked ], [ %indvars.iv9.unr.ph, %for.body16.us.preheader28 ], [ %ind.end, %middle.block ]
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 10)
  %77 = add i64 %pgocount14, 1
  store i64 %77, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 10)
  br label %for.body16.us

min.iters.checked:                                ; preds = %for.body16.us.preheader28
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 14)
  %78 = add i64 %pgocount15, 1
  store i64 %78, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 14)
  %n.mod.vf = and i64 %76, 1
  %n.vec = sub i64 %76, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body16.us.preheader93, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 16)
  %79 = add i64 %pgocount16, 1
  store i64 %79, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 16)
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv9.unr.ph
  %80 = sub nsw i64 %9, %indvars.iv9.unr.ph
  %81 = and i64 %80, -2
  %82 = add nsw i64 %indvars.iv9.unr.ph, %81
  %scevgep33 = getelementptr double, double* %scevgep32, i64 %82
  %scevgep36 = getelementptr double, double* %scevgep35, i64 %indvars.iv9.unr.ph
  %scevgep39 = getelementptr double, double* %scevgep38, i64 %82
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ult double* %scevgep36, %scevgep33
  %memcheck.conflict = and i1 %bound0, %bound1
  %83 = add nuw nsw i64 %indvars.iv9.unr.ph, 2
  %84 = shl nuw i64 %75, 1
  %85 = add i64 %83, %84
  %86 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %85, %86
  br i1 %memcheck.conflict, label %for.body16.us.preheader93, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %87 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv9.unr.ph, %87
  %88 = add nsw i64 %offset.idx, -1
  %89 = getelementptr inbounds double, double* %B, i64 %88
  %90 = bitcast double* %89 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %90, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec41 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %91 = fadd <2 x double> %strided.vec, %strided.vec41
  %92 = add nuw nsw i64 %offset.idx, 1
  %93 = getelementptr inbounds double, double* %B, i64 %92
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec42 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !20
  %strided.vec44 = shufflevector <4 x double> %wide.vec42, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fadd <2 x double> %91, %strided.vec44
  %97 = fmul <2 x double> %96, <double 3.333300e-01, double 3.333300e-01>
  %98 = bitcast double* %93 to <4 x double>*
  %wide.vec45 = load <4 x double>, <4 x double>* %98, align 8, !alias.scope !20
  %strided.vec47 = shufflevector <4 x double> %wide.vec45, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %99 = fadd <4 x double> %wide.vec42, %wide.vec45
  %100 = shufflevector <4 x double> %99, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %101 = fadd <2 x double> %100, %strided.vec47
  %102 = fmul <2 x double> %101, <double 3.333300e-01, double 3.333300e-01>
  %103 = getelementptr inbounds double, double* %A, i64 %92
  %104 = getelementptr double, double* %103, i64 -1
  %105 = bitcast double* %104 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %97, <2 x double> %102, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %105, align 8, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %106 = icmp eq i64 %index.next, %n.vec
  br i1 %106, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !25

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 3)
  %107 = add i64 %pgocount17, 1
  store i64 %107, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 19)
  %108 = add i64 %pgocount18, 1
  store i64 %108, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 19)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc33.us, label %for.body16.us.preheader93

for.cond1.preheader:                              ; preds = %for.cond1.preheader.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader.new
  %t.06 = phi i32 [ %t.06.unr, %for.cond1.preheader.preheader.new ], [ %inc34.7, %for.cond1.preheader.for.cond1.preheader_crit_edge ]
  %inc34.7 = add nsw i32 %t.06, 8
  %exitcond24.7 = icmp eq i32 %inc34.7, %tsteps
  br i1 %exitcond24.7, label %for.end35.loopexit95.unr-lcssa, label %for.cond1.preheader.for.cond1.preheader_crit_edge

for.cond1.preheader.for.cond1.preheader_crit_edge: ; preds = %for.cond1.preheader
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 5)
  %109 = add i64 %pgocount19, 1
  store i64 %109, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 5)
  br label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 21)
  %110 = add i64 %pgocount20, 1
  store i64 %110, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 21)
  br label %for.end35

for.end35.loopexit95.unr-lcssa:                   ; preds = %for.cond1.preheader
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 23)
  %111 = add i64 %pgocount21, 1
  store i64 %111, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 23)
  br label %for.end35.loopexit95

for.end35.loopexit95:                             ; preds = %for.end35.loopexit95.unr-lcssa, %for.cond1.preheader.prol.loopexit
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 20)
  %112 = add i64 %pgocount22, 1
  store i64 %112, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 20)
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit95, %for.end35.loopexit, %entry
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 17)
  %113 = add i64 %pgocount23, 1
  store i64 %113, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 17)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end

if.then:                                          ; preds = %for.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %8 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %9 = add i64 %pgocount2, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %10 = add i64 %pgocount3, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7, !8}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !7, !8}
