; ModuleID = 'B.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_atax = private constant [16 x i8] c"B.ll:kernel_atax"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 131680681903, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_atax = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_atax = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7745204956806891293, i64 195543935330, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_atax\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_atax to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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
  tail call fastcc void @print_array(i32 2100, double* %arraydecay7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  %conv = sitofp i32 %n to double
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.body.preheader, label %for.cond3.preheader

for.body.preheader:                               ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %xtraiter18 = and i32 %n, 1
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %1 = add i64 %pgocount1, 1
  store i64 %1, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %div.prol = fdiv double 0.000000e+00, %conv
  %add.prol = fadd double %div.prol, 1.000000e+00
  store double %add.prol, double* %x, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv14.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.cond3.preheader, label %for.body.preheader20

for.body.preheader20:                             ; preds = %for.body.prol.loopexit
  %wide.trip.count16.1 = zext i32 %n to i64
  br label %for.body

for.cond3.preheader.loopexit:                     ; preds = %for.body
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.loopexit, %for.body.prol.loopexit, %entry
  %cmp43 = icmp sgt i32 %m, 0
  br i1 %cmp43, label %for.cond7.preheader.lr.ph, label %for.end24

for.cond7.preheader.lr.ph:                        ; preds = %for.cond3.preheader
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %4 = add i64 %pgocount3, 1
  store i64 %4, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %cmp81 = icmp sgt i32 %n, 0
  %mul = mul nsw i32 %m, 5
  %conv13 = sitofp i32 %mul to double
  br i1 %cmp81, label %for.cond7.preheader.us.preheader, label %for.end24

for.cond7.preheader.us.preheader:                 ; preds = %for.cond7.preheader.lr.ph
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %n, 1
  %wide.trip.count12 = zext i32 %m to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond7.preheader.us

for.cond7.preheader.us:                           ; preds = %for.cond7.for.inc22_crit_edge.us, %for.cond7.preheader.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body10.us.prol.loopexit, label %for.body10.us.prol

for.body10.us.prol:                               ; preds = %for.cond7.preheader.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %6 = add i64 %pgocount4, 1
  store i64 %6, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %7 = trunc i64 %indvars.iv10 to i32
  %rem.us.prol = srem i32 %7, %n
  %conv12.us.prol = sitofp i32 %rem.us.prol to double
  %div14.us.prol = fdiv double %conv12.us.prol, %conv13
  %arrayidx18.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv10, i64 0
  store double %div14.us.prol, double* %arrayidx18.us.prol, align 8
  br label %for.body10.us.prol.loopexit

for.body10.us.prol.loopexit:                      ; preds = %for.body10.us.prol, %for.cond7.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body10.us.prol ], [ 0, %for.cond7.preheader.us ]
  br i1 %5, label %for.body10.us.prol.loopexit.for.cond7.for.inc22_crit_edge.us_crit_edge, label %for.body10.us.preheader

for.body10.us.prol.loopexit.for.cond7.for.inc22_crit_edge.us_crit_edge: ; preds = %for.body10.us.prol.loopexit
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %8 = add i64 %pgocount5, 1
  store i64 %8, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.cond7.for.inc22_crit_edge.us

for.body10.us.preheader:                          ; preds = %for.body10.us.prol.loopexit
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us.for.body10.us_crit_edge, %for.body10.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body10.us.for.body10.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body10.us.preheader ]
  %9 = add nuw nsw i64 %indvars.iv, %indvars.iv10
  %10 = trunc i64 %9 to i32
  %rem.us = srem i32 %10, %n
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, %conv13
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = add nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %12 = trunc i64 %11 to i32
  %rem.us.1 = srem i32 %12, %n
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.1 = fdiv double %conv12.us.1, %conv13
  %arrayidx18.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %div14.us.1, double* %arrayidx18.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.loopexit, label %for.body10.us.for.body10.us_crit_edge

for.body10.us.for.body10.us_crit_edge:            ; preds = %for.body10.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %13 = add i64 %pgocount6, 1
  store i64 %13, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body10.us

for.cond7.for.inc22_crit_edge.us.loopexit:        ; preds = %for.body10.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %14 = add i64 %pgocount7, 1
  store i64 %14, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.cond7.for.inc22_crit_edge.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us.prol.loopexit.for.cond7.for.inc22_crit_edge.us_crit_edge, %for.cond7.for.inc22_crit_edge.us.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond, label %for.end24.loopexit, label %for.cond7.preheader.us

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader20
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %for.body.for.body_crit_edge ], [ %indvars.iv14.unr, %for.body.preheader20 ]
  %15 = trunc i64 %indvars.iv14 to i32
  %conv2 = sitofp i32 %15 to double
  %div = fdiv double %conv2, %conv
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv14
  store double %add, double* %arrayidx, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %16 = trunc i64 %indvars.iv.next15 to i32
  %conv2.1 = sitofp i32 %16 to double
  %div.1 = fdiv double %conv2.1, %conv
  %add.1 = fadd double %div.1, 1.000000e+00
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next15
  store double %add.1, double* %arrayidx.1, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, %wide.trip.count16.1
  br i1 %exitcond17.1, label %for.cond3.preheader.loopexit, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %17 = add i64 %pgocount8, 1
  store i64 %17, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body

for.end24.loopexit:                               ; preds = %for.cond7.for.inc22_crit_edge.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %18 = add i64 %pgocount9, 1
  store i64 %18, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %for.cond7.preheader.lr.ph, %for.cond3.preheader
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %19 = add i64 %pgocount10, 1
  store i64 %19, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) unnamed_addr #2 {
entry:
  %tmp55 = bitcast double* %tmp to i8*
  %cmp37 = icmp sgt i32 %n, 0
  br i1 %cmp37, label %for.cond3.preheader.loopexit, label %for.cond3.preheader

for.cond3.preheader.loopexit:                     ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 14)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 14)
  %y60 = bitcast double* %y to i8*
  %1 = add i32 %n, -1
  %2 = zext i32 %1 to i64
  %3 = shl nuw nsw i64 %2, 3
  %4 = add nuw nsw i64 %3, 8
  call void @llvm.memset.p0i8.i64(i8* %y60, i8 0, i64 %4, i32 8, i1 false)
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.loopexit, %entry
  %cmp45 = icmp sgt i32 %m, 0
  br i1 %cmp45, label %for.body5.lr.ph, label %for.end44

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  %cmp91 = icmp sgt i32 %n, 0
  %cmp253 = icmp sgt i32 %n, 0
  br i1 %cmp91, label %for.body5.us.preheader, label %for.end44.loopexit39

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %5 = add i32 %n, -1
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %5, 0
  %xtraiter43 = and i32 %n, 1
  %lcmp.mod44 = icmp eq i32 %xtraiter43, 0
  %7 = icmp eq i32 %5, 0
  %wide.trip.count42.1 = zext i32 %n to i64
  %wide.trip.count49 = zext i32 %m to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %8 = add nsw i64 %wide.trip.count42.1, -2
  %scevgep64 = getelementptr double, double* %y, i64 2
  %9 = add nsw i64 %wide.trip.count42.1, -2
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next48, %for.inc42.us ]
  %scevgep70 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 2
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv47
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  br i1 %lcmp.mod, label %for.body10.us.prol.loopexit, label %for.body10.us.prol

for.body10.us.prol:                               ; preds = %for.body5.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 6)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 6)
  %11 = load double, double* %arrayidx7.us, align 8
  %arrayidx16.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 0
  %12 = load double, double* %arrayidx16.us.prol, align 8
  %13 = load double, double* %x, align 8
  %mul.us.prol = fmul double %12, %13
  %add.us.prol = fadd double %11, %mul.us.prol
  store double %add.us.prol, double* %arrayidx7.us, align 8
  br label %for.body10.us.prol.loopexit

for.body10.us.prol.loopexit:                      ; preds = %for.body10.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body10.us.prol ], [ 0, %for.body5.us ]
  br i1 %6, label %for.cond8.for.cond24.preheader_crit_edge.us, label %for.body10.us.preheader

for.body10.us.preheader:                          ; preds = %for.body10.us.prol.loopexit
  br label %for.body10.us

for.inc42.us.loopexit:                            ; preds = %for.body26.us
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge, %middle.block, %for.body26.us.prol.loopexit, %for.inc42.us.loopexit
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond, label %for.end44.loopexit, label %for.body5.us

for.body26.us:                                    ; preds = %for.body26.us.for.body26.us_crit_edge, %for.body26.us.preheader81
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %for.body26.us.for.body26.us_crit_edge ], [ %indvars.iv40.ph, %for.body26.us.preheader81 ]
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv40
  %14 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv40
  %15 = load double, double* %arrayidx32.us, align 8
  %16 = load double, double* %arrayidx7.us, align 8
  %mul35.us = fmul double %15, %16
  %add36.us = fadd double %14, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next41
  %17 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next41
  %18 = load double, double* %arrayidx32.us.1, align 8
  %19 = load double, double* %arrayidx7.us, align 8
  %mul35.us.1 = fmul double %18, %19
  %add36.us.1 = fadd double %17, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond.146 = icmp eq i64 %indvars.iv.next41.1, %wide.trip.count42.1
  br i1 %exitcond.146, label %for.inc42.us.loopexit, label %for.body26.us.for.body26.us_crit_edge, !llvm.loop !1

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 1)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 1)
  br label %for.body26.us

for.body10.us:                                    ; preds = %for.body10.us.for.body10.us_crit_edge, %for.body10.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body10.us.for.body10.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body10.us.preheader ]
  %21 = load double, double* %arrayidx7.us, align 8
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %23 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %22, %23
  %add.us = fadd double %21, %mul.us
  store double %add.us, double* %arrayidx7.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next
  %24 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %25 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %24, %25
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx7.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond8.for.cond24.preheader_crit_edge.us.loopexit, label %for.body10.us.for.body10.us_crit_edge

for.body10.us.for.body10.us_crit_edge:            ; preds = %for.body10.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 0)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 0)
  br label %for.body10.us

for.cond8.for.cond24.preheader_crit_edge.us.loopexit: ; preds = %for.body10.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 4)
  %27 = add i64 %pgocount4, 1
  store i64 %27, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 4)
  br label %for.cond8.for.cond24.preheader_crit_edge.us

for.cond8.for.cond24.preheader_crit_edge.us:      ; preds = %for.cond8.for.cond24.preheader_crit_edge.us.loopexit, %for.body10.us.prol.loopexit
  br i1 %cmp253, label %for.body26.us.preheader, label %for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge

for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge: ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 3)
  %28 = add i64 %pgocount5, 1
  store i64 %28, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 3)
  br label %for.inc42.us

for.body26.us.preheader:                          ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 5)
  %29 = add i64 %pgocount6, 1
  store i64 %29, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 5)
  br i1 %lcmp.mod44, label %for.body26.us.prol.loopexit, label %for.body26.us.prol

for.body26.us.prol:                               ; preds = %for.body26.us.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 9)
  %30 = add i64 %pgocount7, 1
  store i64 %30, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 9)
  %31 = load double, double* %y, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 0
  %32 = load double, double* %arrayidx32.us.prol, align 8
  %33 = load double, double* %arrayidx7.us, align 8
  %mul35.us.prol = fmul double %32, %33
  %add36.us.prol = fadd double %31, %mul35.us.prol
  store double %add36.us.prol, double* %y, align 8
  br label %for.body26.us.prol.loopexit

for.body26.us.prol.loopexit:                      ; preds = %for.body26.us.prol, %for.body26.us.preheader
  %indvars.iv40.unr.ph = phi i64 [ 1, %for.body26.us.prol ], [ 0, %for.body26.us.preheader ]
  br i1 %7, label %for.inc42.us, label %for.body26.us.preheader62

for.body26.us.preheader62:                        ; preds = %for.body26.us.prol.loopexit
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 7)
  %34 = add i64 %pgocount8, 1
  store i64 %34, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 7)
  %35 = sub nsw i64 %8, %indvars.iv40.unr.ph
  %36 = lshr i64 %35, 1
  %37 = add nuw i64 %36, 1
  %min.iters.check = icmp ult i64 %37, 2
  br i1 %min.iters.check, label %for.body26.us.preheader81, label %min.iters.checked

for.body26.us.preheader81:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body26.us.preheader62
  %indvars.iv40.ph = phi i64 [ %indvars.iv40.unr.ph, %vector.memcheck ], [ %indvars.iv40.unr.ph, %min.iters.checked ], [ %indvars.iv40.unr.ph, %for.body26.us.preheader62 ], [ %ind.end, %middle.block ]
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 8)
  %38 = add i64 %pgocount9, 1
  store i64 %38, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 8)
  br label %for.body26.us

min.iters.checked:                                ; preds = %for.body26.us.preheader62
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 10)
  %39 = add i64 %pgocount10, 1
  store i64 %39, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 10)
  %n.mod.vf = and i64 %37, 1
  %n.vec = sub i64 %37, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body26.us.preheader81, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 11)
  %40 = add i64 %pgocount11, 1
  store i64 %40, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 11)
  %scevgep = getelementptr double, double* %y, i64 %indvars.iv40.unr.ph
  %41 = sub nsw i64 %9, %indvars.iv40.unr.ph
  %42 = and i64 %41, -2
  %43 = or i64 %indvars.iv40.unr.ph, %42
  %scevgep65 = getelementptr double, double* %scevgep64, i64 %43
  %scevgep68 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv40.unr.ph
  %scevgep71 = getelementptr double, double* %scevgep70, i64 %43
  %bound0 = icmp ult double* %scevgep, %scevgep71
  %bound1 = icmp ult double* %scevgep68, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bound074 = icmp ult double* %scevgep, %arrayidx7.us
  %bound175 = icmp ult double* %arrayidx7.us, %scevgep65
  %found.conflict76 = and i1 %bound074, %bound175
  %conflict.rdx = or i1 %found.conflict, %found.conflict76
  %44 = or i64 %indvars.iv40.unr.ph, 2
  %45 = shl nuw i64 %36, 1
  %46 = add i64 %44, %45
  %47 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %46, %47
  br i1 %conflict.rdx, label %for.body26.us.preheader81, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %48 = load double, double* %arrayidx7.us, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = load double, double* %arrayidx7.us, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %54 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv40.unr.ph, %54
  %55 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %56 = bitcast double* %55 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %56, align 8, !alias.scope !7, !noalias !9
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec77 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %57 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %offset.idx
  %58 = bitcast double* %57 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %58, align 8, !alias.scope !11
  %strided.vec79 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %59 = fmul <2 x double> %strided.vec79, %50
  %60 = fadd <2 x double> %strided.vec, %59
  %61 = add nuw nsw i64 %offset.idx, 1
  %62 = getelementptr inbounds double, double* %y, i64 %61
  %63 = fmul <2 x double> %strided.vec80, %53
  %64 = fadd <2 x double> %strided.vec77, %63
  %65 = getelementptr double, double* %62, i64 -1
  %66 = bitcast double* %65 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %60, <2 x double> %64, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %66, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 2
  %67 = icmp eq i64 %index.next, %n.vec
  br i1 %67, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !12

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 2)
  %68 = add i64 %pgocount12, 1
  store i64 %68, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 2)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 13)
  %69 = add i64 %pgocount13, 1
  store i64 %69, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 13)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc42.us, label %for.body26.us.preheader81

for.end44.loopexit39:                             ; preds = %for.body5.lr.ph
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 16)
  %70 = add i64 %pgocount14, 1
  store i64 %70, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 16)
  %71 = add i32 %m, -1
  %72 = zext i32 %71 to i64
  %73 = shl nuw nsw i64 %72, 3
  %74 = add nuw nsw i64 %73, 8
  call void @llvm.memset.p0i8.i64(i8* %tmp55, i8 0, i64 %74, i32 8, i1 false)
  br label %for.end44

for.end44.loopexit:                               ; preds = %for.inc42.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 15)
  %75 = add i64 %pgocount15, 1
  store i64 %75, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 15)
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %for.end44.loopexit39, %for.cond3.preheader
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 12)
  %76 = add i64 %pgocount16, 1
  store i64 %76, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 12)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %8 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
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
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10, !5}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
