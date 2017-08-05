; ModuleID = 'B.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_trisolv = private constant [19 x i8] c"B.ll:kernel_trisolv"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 77261525566, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_trisolv = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_trisolv = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9203314144398365966, i64 82652651945, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_trisolv\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_trisolv to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay3 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %L, double* nocapture %x, double* nocapture %b) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %add = add i32 %n, 1
  %conv9 = sitofp i32 %n to double
  %wide.trip.count11 = zext i32 %n to i64
  br label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.inc14, %for.body.lr.ph
  %indvars.iv9 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next10, %for.inc14 ]
  %indvars.iv7 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next8, %for.inc14 ]
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv9
  store double -9.990000e+02, double* %arrayidx, align 8
  %0 = trunc i64 %indvars.iv9 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv9
  store double %conv, double* %arrayidx2, align 8
  %1 = trunc i64 %indvars.iv9 to i32
  %sub = add i32 %add, %1
  %xtraiter12 = and i64 %indvars.iv.next10, 1
  %lcmp.mod = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %conv8.prol = sitofp i32 %sub to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, %conv9
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %3 = icmp eq i64 %indvars.iv9, 0
  br i1 %3, label %for.body6.prol.loopexit.for.inc14_crit_edge, label %for.body6.preheader

for.body6.prol.loopexit.for.inc14_crit_edge:      ; preds = %for.body6.prol.loopexit
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.inc14

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.for.body6_crit_edge ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %5 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %sub, %5
  %conv8 = sitofp i32 %add7 to double
  %mul = fmul double %conv8, 2.000000e+00
  %div = fdiv double %mul, %conv9
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv
  store double %div, double* %arrayidx13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %sub, %6
  %conv8.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv8.1, 2.000000e+00
  %div.1 = fdiv double %mul.1, %conv9
  %arrayidx13.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx13.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv7
  br i1 %exitcond.1, label %for.inc14.loopexit, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %7 = add i64 %pgocount2, 1
  store i64 %7, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body6

for.inc14.loopexit:                               ; preds = %for.body6
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %8 = add i64 %pgocount3, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.inc14

for.inc14:                                        ; preds = %for.body6.prol.loopexit.for.inc14_crit_edge, %for.inc14.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond, label %for.end16.loopexit, label %for.body6.lr.ph

for.end16.loopexit:                               ; preds = %for.inc14
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %9 = add i64 %pgocount4, 1
  store i64 %9, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.end16

for.end16:                                        ; preds = %for.end16.loopexit, %entry
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %10 = add i64 %pgocount5, 1
  store i64 %10, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* nocapture readonly %L, double* nocapture %x, double* nocapture readonly %b) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %for.end24

for.body.preheader:                               ; preds = %entry
  %wide.trip.count11 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.end ], [ 0, %for.body.preheader ]
  %0 = add i64 %indvars.iv9, 4294967295
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv9
  %1 = bitcast double* %arrayidx to i64*
  %2 = load i64, i64* %1, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv9
  %3 = bitcast double* %arrayidx2 to i64*
  store i64 %2, i64* %3, align 8
  %cmp41 = icmp sgt i64 %indvars.iv9, 0
  br i1 %cmp41, label %for.body5.preheader, label %for.body.for.end_crit_edge

for.body.for.end_crit_edge:                       ; preds = %for.body
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 1)
  br label %for.end

for.body5.preheader:                              ; preds = %for.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 2)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 2)
  %xtraiter13 = and i64 %indvars.iv9, 1
  %lcmp.mod = icmp eq i64 %xtraiter13, 0
  br i1 %lcmp.mod, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 4)
  %6 = add i64 %pgocount2, 1
  store i64 %6, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 4)
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 0
  %7 = load double, double* %arrayidx9.prol, align 8
  %8 = load double, double* %x, align 8
  %mul.prol = fmul double %7, %8
  %9 = load double, double* %arrayidx2, align 8
  %sub.prol = fsub double %9, %mul.prol
  store double %sub.prol, double* %arrayidx2, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol, %for.body5.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.preheader ]
  %10 = trunc i64 %0 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %for.end, label %for.body5.preheader16

for.body5.preheader16:                            ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.preheader16
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body5.for.body5_crit_edge ], [ %indvars.iv.unr.ph, %for.body5.preheader16 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv
  %12 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %13 = load double, double* %arrayidx11, align 8
  %mul = fmul double %12, %13
  %14 = load double, double* %arrayidx2, align 8
  %sub = fsub double %14, %mul
  store double %sub, double* %arrayidx2, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %15, %16
  %17 = load double, double* %arrayidx2, align 8
  %sub.1 = fsub double %17, %mul.1
  store double %sub.1, double* %arrayidx2, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv9
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 0)
  %18 = add i64 %pgocount3, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 0)
  br label %for.body5

for.end.loopexit:                                 ; preds = %for.body5
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 3)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 3)
  br label %for.end

for.end:                                          ; preds = %for.body.for.end_crit_edge, %for.end.loopexit, %for.body5.prol.loopexit
  %20 = load double, double* %arrayidx2, align 8
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv9
  %21 = load double, double* %arrayidx19, align 8
  %div = fdiv double %20, %21
  store double %div, double* %arrayidx2, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond, label %for.end24.loopexit, label %for.body

for.end24.loopexit:                               ; preds = %for.end
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 6)
  %22 = add i64 %pgocount5, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 6)
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 5)
  %23 = add i64 %pgocount6, 1
  store i64 %23, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp1 = icmp sgt i32 %n, 0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %4 = phi %struct._IO_FILE* [ %10, %for.inc ], [ %3, %for.body.preheader ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %5) #5
  %6 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %6, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.body.for.inc_crit_edge

for.body.for.inc_crit_edge:                       ; preds = %for.body
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %for.inc

if.then:                                          ; preds = %for.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body.for.inc_crit_edge, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %11 = add i64 %pgocount2, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %.lcssa = phi %struct._IO_FILE* [ %3, %entry ], [ %10, %for.end.loopexit ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %12 = add i64 %pgocount3, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #5
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
