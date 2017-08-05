; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %0 = sext i32 %np to i64
  %1 = sext i32 %nq to i64
  %cmp58 = icmp sgt i32 %nr, 0
  br i1 %cmp58, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %2 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %3 = icmp eq i64 %2, 0
  %sunkaddr72 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %xtraiter67 = and i64 %0, 3
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %4 = icmp ult i64 %2, 3
  %wide.trip.count = zext i32 %nr to i64
  %.not = icmp slt i32 %nq, 1
  %.not76 = icmp slt i32 %np, 1
  %brmerge = or i1 %.not, %.not76
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next, %for.inc42 ]
  br i1 %brmerge, label %for.inc42, label %for.body6.us.us.preheader.preheader

for.body6.us.us.preheader.preheader:              ; preds = %for.cond1.preheader
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.preheader.preheader, %for.inc39.us
  %indvars.iv1831.us = phi i64 [ %indvars.iv.next19.us, %for.inc39.us ], [ 0, %for.body6.us.us.preheader.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.body27.us.prol.loopexit
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1831.us, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next19.us, %1
  br i1 %exitcond65, label %for.inc42.loopexit, label %for.body6.us.us.preheader

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv1629.us = phi i64 [ %indvars.iv.next17.us.3, %for.body27.us ], [ %indvars.iv1629.us.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1629.us
  %5 = bitcast double* %arrayidx29.us to i64*
  %6 = load i64, i64* %5, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv1629.us
  %7 = bitcast double* %arrayidx35.us to i64*
  store i64 %6, i64* %7, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1629.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.us
  %8 = bitcast double* %arrayidx29.us.1 to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv.next17.us
  %10 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next17.us.1 = add nsw i64 %indvars.iv1629.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.us.1
  %11 = bitcast double* %arrayidx29.us.2 to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv.next17.us.1
  %13 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next17.us.2 = add nsw i64 %indvars.iv1629.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.us.2
  %14 = bitcast double* %arrayidx29.us.3 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv.next17.us.2
  %16 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next17.us.3 = add nsw i64 %indvars.iv1629.us, 4
  %exitcond63.3 = icmp eq i64 %indvars.iv.next17.us.3, %0
  br i1 %exitcond63.3, label %for.inc39.us.loopexit, label %for.body27.us

for.body6.us.us:                                  ; preds = %for.cond7.for.inc22_crit_edge.us.us, %for.body6.us.us.preheader
  %indvars.iv1425.us.us = phi i64 [ %indvars.iv.next15.us.us, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1425.us.us
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %17 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv1425.us.us
  %18 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %17, %18
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr69 = shl i64 %indvars.iv1425.us.us, 3
  %sunkaddr70 = add i64 %sunkaddr, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  store double %add.us.us.prol, double* %sunkaddr71, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv23.us.us.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %3, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr73 = shl i64 %indvars.iv1425.us.us, 3
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next15.us.us = add nuw nsw i64 %indvars.iv1425.us.us, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next15.us.us, %0
  br i1 %exitcond61, label %for.body27.lr.ph.us, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %19 = phi double [ %add.us.us.1, %for.body9.us.us ], [ %.unr.ph, %for.body9.us.us.preheader ]
  %indvars.iv23.us.us = phi i64 [ %indvars.iv.next.us.us.1, %for.body9.us.us ], [ %indvars.iv23.us.us.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv23.us.us
  %20 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv23.us.us, i64 %indvars.iv1425.us.us
  %21 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %20, %21
  %add.us.us = fadd double %19, %mul.us.us
  store double %add.us.us, double* %sunkaddr75, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv23.us.us, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv.next.us.us
  %22 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us.us, i64 %indvars.iv1425.us.us
  %23 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %22, %23
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr75, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv23.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, %0
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %lcmp.mod68, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv1629.us.prol = phi i64 [ %indvars.iv.next17.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.us.prol ], [ %xtraiter67, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1629.us.prol
  %24 = bitcast double* %arrayidx29.us.prol to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv, i64 %indvars.iv1831.us, i64 %indvars.iv1629.us.prol
  %26 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next17.us.prol = add nuw nsw i64 %indvars.iv1629.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv1629.us.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next17.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %4, label %for.inc39.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond66, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv1420 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv1119 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next12, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv1119, %indvars.iv1420
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv818 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next9.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv818, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1420, i64 %indvars.iv1119, i64 %indvars.iv818
  %indvars.iv.next9 = or i64 %indvars.iv818, 1
  %3 = add nuw nsw i64 %indvars.iv.next9, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv818, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next9.1, 160
  br i1 %exitcond22.1, label %for.inc12, label %for.body6

for.inc12:                                        ; preds = %for.body6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1119, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next12, 140
  br i1 %exitcond23, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1420, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next15, 150
  br i1 %exitcond24, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv617 = phi i64 [ %indvars.iv.next7, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %6 = mul nuw nsw i64 %indvars.iv16, %indvars.iv617
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv617, i64 %indvars.iv16
  %indvars.iv.next = or i64 %indvars.iv16, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv617
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv617, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next7, 160
  br i1 %exitcond21, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv712 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv712, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv511 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next6, %for.inc18 ]
  %mul83 = add nuw nsw i64 %indvars.iv511, %3
  %add = mul nuw nsw i64 %mul83, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv10, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv712, i64 %indvars.iv511, i64 %indvars.iv10
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next6, 140
  br i1 %exitcond13, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next8, 150
  br i1 %exitcond14, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
