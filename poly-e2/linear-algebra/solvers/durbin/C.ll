; ModuleID = 'B.ll'
source_filename = "durbin.c"
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
@__profn_B.ll_kernel_durbin = private constant [18 x i8] c"B.ll:kernel_durbin"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 70332555079, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_durbin = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_durbin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -945145266756008212, i64 164267169623, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_durbin\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_durbin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %arraydecay, double* %arraydecay3)
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
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %r) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %add = add nsw i32 %n, 1
  %1 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  br label %for.body.prol

for.body.prol:                                    ; preds = %for.body.prol.for.body.prol_crit_edge, %for.body.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol.for.body.prol_crit_edge ], [ 0, %for.body.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body.prol.for.body.prol_crit_edge ], [ %xtraiter, %for.body.prol.preheader ]
  %2 = trunc i64 %indvars.iv.prol to i32
  %sub.prol = sub i32 %add, %2
  %conv.prol = sitofp i32 %sub.prol to double
  %arrayidx.prol = getelementptr inbounds double, double* %r, i64 %indvars.iv.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.prol.loopexit.loopexit, label %for.body.prol.for.body.prol_crit_edge, !llvm.loop !1

for.body.prol.for.body.prol_crit_edge:            ; preds = %for.body.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %3 = add i64 %pgocount1, 1
  store i64 %3, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body.prol

for.body.prol.loopexit.loopexit:                  ; preds = %for.body.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %4 = add i64 %pgocount2, 1
  store i64 %4, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol.loopexit.loopexit, %for.body.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol.loopexit.loopexit ]
  %5 = icmp ult i32 %1, 3
  br i1 %5, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body.for.body_crit_edge ], [ %indvars.iv.unr, %for.body.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %sub = sub i32 %add, %6
  %conv = sitofp i32 %sub to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %sub.1 = sub i32 %add, %7
  %conv.1 = sitofp i32 %sub.1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %8 = trunc i64 %indvars.iv.next.1 to i32
  %sub.2 = sub i32 %add, %8
  %conv.2 = sitofp i32 %sub.2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %9 = trunc i64 %indvars.iv.next.2 to i32
  %sub.3 = sub i32 %add, %9
  %conv.3 = sitofp i32 %sub.3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %10 = add i64 %pgocount3, 1
  store i64 %10, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body

for.end.loopexit:                                 ; preds = %for.body
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %11 = add i64 %pgocount4, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body.prol.loopexit, %entry
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %12 = add i64 %pgocount5, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32 %n, double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
entry:
  %y29 = bitcast double* %y to i8*
  %z = alloca [2000 x double], align 16
  %z30 = bitcast [2000 x double]* %z to i8*
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %cmp8 = icmp sgt i32 %n, 1
  br i1 %cmp8, label %for.body.preheader, label %for.end49

for.body.preheader:                               ; preds = %entry
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = add i32 %n, -1
  %arrayidx31.prol = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 0
  %wide.trip.count37 = zext i32 %2 to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.end44, %for.body.preheader
  %indvars.iv33 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next34, %for.end44 ]
  %indvar31 = phi i64 [ 0, %for.body.preheader ], [ %indvar.next32, %for.end44 ]
  %indvar = phi i32 [ 0, %for.body.preheader ], [ %indvar.next, %for.end44 ]
  %alpha.010 = phi double [ %sub3, %for.body.preheader ], [ %div, %for.end44 ]
  %beta.09 = phi double [ 1.000000e+00, %for.body.preheader ], [ %mul5, %for.end44 ]
  %3 = add i64 %indvar31, -1
  %4 = shl i64 %indvar31, 3
  %5 = add nuw nsw i64 %4, 8
  %mul = fmul double %alpha.010, %alpha.010
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.09, %sub4
  %6 = add nuw nsw i32 %indvar, 1
  %7 = add nsw i64 %indvars.iv33, -1
  %xtraiter = and i32 %6, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.for.inc.prol_crit_edge, %for.inc.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %sum.02.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %xtraiter, %for.inc.prol.preheader ]
  %8 = sub nsw i64 %7, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %8
  %9 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %10 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %9, %10
  %add.prol = fadd double %sum.02.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 0)
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 5)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 5)
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %sum.02.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %indvar, 3
  br i1 %13, label %for.body21.lr.ph, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.for.inc_crit_edge ], [ %indvars.iv.unr, %for.inc.preheader ]
  %sum.02 = phi double [ %add.3, %for.inc.for.inc_crit_edge ], [ %sum.02.unr, %for.inc.preheader ]
  %14 = sub nsw i64 %7, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %14
  %15 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %16 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %15, %16
  %add = fadd double %sum.02, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = sub nsw i64 %7, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %17
  %18 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %18, %19
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %20 = sub nsw i64 %7, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %20
  %21 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %22 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %21, %22
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %23 = sub nsw i64 %7, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %23
  %24 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %25 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %24, %25
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %for.body21.lr.ph.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 2)
  br label %for.inc

for.body21.lr.ph.loopexit:                        ; preds = %for.inc
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 8)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 8)
  br label %for.body21.lr.ph

for.body21.lr.ph:                                 ; preds = %for.body21.lr.ph.loopexit, %for.inc.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.body21.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv33
  %28 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %28
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %29 = add nsw i64 %indvars.iv33, -1
  %30 = and i32 %indvar, 1
  %lcmp.mod22 = icmp eq i32 %30, 0
  br i1 %lcmp.mod22, label %for.body21.prol, label %for.body21.prol.loopexit

for.body21.prol:                                  ; preds = %for.body21.lr.ph
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 9)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 9)
  %32 = load double, double* %y, align 8
  %arrayidx27.prol = getelementptr inbounds double, double* %y, i64 %29
  %33 = load double, double* %arrayidx27.prol, align 8
  %mul28.prol = fmul double %div, %33
  %add29.prol = fadd double %32, %mul28.prol
  store double %add29.prol, double* %arrayidx31.prol, align 16
  br label %for.body21.prol.loopexit

for.body21.prol.loopexit:                         ; preds = %for.body21.prol, %for.body21.lr.ph
  %indvars.iv15.unr.ph = phi i64 [ 1, %for.body21.prol ], [ 0, %for.body21.lr.ph ]
  %34 = icmp eq i32 %indvar, 0
  br i1 %34, label %for.body21.prol.loopexit.for.end44_crit_edge, label %for.body21.preheader

for.body21.prol.loopexit.for.end44_crit_edge:     ; preds = %for.body21.prol.loopexit
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 4)
  %35 = add i64 %pgocount5, 1
  store i64 %35, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 4)
  br label %for.end44

for.body21.preheader:                             ; preds = %for.body21.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 6)
  %36 = add i64 %pgocount6, 1
  store i64 %36, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 6)
  %37 = sub i64 %3, %indvars.iv15.unr.ph
  %38 = lshr i64 %37, 1
  %39 = add nuw i64 %38, 1
  %min.iters.check = icmp ult i64 %39, 2
  br i1 %min.iters.check, label %for.body21.preheader45, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body21.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 10)
  %40 = add i64 %pgocount7, 1
  store i64 %40, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 10)
  %n.mod.vf = and i64 %39, 1
  %n.vec = sub i64 %39, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %41 = or i64 %indvars.iv15.unr.ph, 2
  %42 = shl nuw i64 %38, 1
  %43 = add i64 %41, %42
  %44 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %43, %44
  br i1 %cmp.zero, label %for.body21.preheader45, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert43 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat44 = shufflevector <2 x double> %broadcast.splatinsert43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %45 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv15.unr.ph, %45
  %46 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %47 = bitcast double* %46 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %47, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec38 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %48 = sub nsw i64 %29, %offset.idx
  %49 = getelementptr inbounds double, double* %y, i64 %48
  %50 = getelementptr double, double* %49, i64 -3
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec39 = load <4 x double>, <4 x double>* %51, align 8
  %strided.vec40 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec40, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec41 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse42 = shufflevector <2 x double> %strided.vec41, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %52 = fmul <2 x double> %broadcast.splat44, %reverse42
  %53 = fadd <2 x double> %strided.vec, %52
  %54 = add nuw nsw i64 %offset.idx, 1
  %55 = fmul <2 x double> %broadcast.splat44, %reverse
  %56 = fadd <2 x double> %strided.vec38, %55
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %54
  %58 = getelementptr double, double* %57, i64 -1
  %59 = bitcast double* %58 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %53, <2 x double> %56, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %59, align 8
  %index.next = add i64 %index, 2
  %60 = icmp eq i64 %index.next, %n.vec
  br i1 %60, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !4

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 3)
  %61 = add i64 %pgocount8, 1
  store i64 %61, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 11)
  %62 = add i64 %pgocount9, 1
  store i64 %62, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 11)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end44, label %for.body21.preheader45

for.body21.preheader45:                           ; preds = %middle.block, %min.iters.checked, %for.body21.preheader
  %indvars.iv15.ph = phi i64 [ %indvars.iv15.unr.ph, %min.iters.checked ], [ %indvars.iv15.unr.ph, %for.body21.preheader ], [ %ind.end, %middle.block ]
  br label %for.body21

for.body21:                                       ; preds = %for.body21.for.body21_crit_edge, %for.body21.preheader45
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %for.body21.for.body21_crit_edge ], [ %indvars.iv15.ph, %for.body21.preheader45 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv15
  %63 = load double, double* %arrayidx23, align 8
  %64 = sub nsw i64 %29, %indvars.iv15
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %64
  %65 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %65
  %add29 = fadd double %63, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv15
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next16
  %66 = load double, double* %arrayidx23.1, align 8
  %67 = sub nsw i64 %29, %indvars.iv.next16
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %67
  %68 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %68
  %add29.1 = fadd double %66, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next16
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next16.1, %indvars.iv33
  br i1 %exitcond.1, label %for.end44.loopexit, label %for.body21.for.body21_crit_edge, !llvm.loop !7

for.body21.for.body21_crit_edge:                  ; preds = %for.body21
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 1)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 1)
  br label %for.body21

for.end44.loopexit:                               ; preds = %for.body21
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 7)
  %70 = add i64 %pgocount11, 1
  store i64 %70, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 7)
  br label %for.end44

for.end44:                                        ; preds = %for.body21.prol.loopexit.for.end44_crit_edge, %for.end44.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %y29, i8* nonnull %z30, i64 %5, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv33
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvar.next32 = add nuw nsw i64 %indvar31, 1
  %exitcond = icmp eq i64 %indvar.next32, %wide.trip.count37
  br i1 %exitcond, label %for.end49.loopexit, label %for.inc.lr.ph

for.end49.loopexit:                               ; preds = %for.end44
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 13)
  %71 = add i64 %pgocount12, 1
  store i64 %71, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 13)
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 12)
  %72 = add i64 %pgocount13, 1
  store i64 %72, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 12)
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
