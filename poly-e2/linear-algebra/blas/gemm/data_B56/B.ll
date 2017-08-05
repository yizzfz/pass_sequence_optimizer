; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp17 = icmp sgt i32 %ni, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.cond34.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %nj, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp216, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %nj, -1
  %1 = sext i32 %ni to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next44, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nuw nsw i64 %indvars.iv37, %indvars.iv43
  %3 = add nuw nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv37
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond42 = icmp eq i64 %indvars.iv37, %wide.trip.count41
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  br i1 %exitcond42, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond51 = icmp ne i64 %indvars.iv.next44, %1
  br i1 %exitcond51, label %for.cond1.preheader.us, label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  %cmp1112 = icmp sgt i32 %ni, 0
  br i1 %cmp1112, label %for.cond14.preheader.lr.ph, label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader, %for.cond1.preheader.lr.ph
  %cmp1511 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp1511, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %5 = add i32 %nk, -1
  %6 = sext i32 %ni to i64
  %wide.trip.count32 = zext i32 %5 to i64
  %7 = and i64 %wide.trip.count32, 1
  %lcmp.mod = icmp eq i64 %7, 0
  %8 = icmp eq i32 %5, 0
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.us.preheader
  %indvars.iv34 = phi i64 [ 0, %for.cond14.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond14.for.inc31_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body17.us.prol.preheader, label %for.body17.us.prol.loopexit.unr-lcssa

for.body17.us.prol.preheader:                     ; preds = %for.cond14.preheader.us
  br label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.body17.us.prol.preheader
  %9 = trunc i64 %indvars.iv34 to i32
  %rem20.us.prol = srem i32 %9, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv34, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit.unr-lcssa

for.body17.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond14.preheader.us, %for.body17.us.prol
  %indvars.iv29.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.body17.us.prol.loopexit.unr-lcssa
  br i1 %8, label %for.cond14.for.inc31_crit_edge.us, label %for.cond14.preheader.us.new

for.cond14.preheader.us.new:                      ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr.ph, %for.cond14.preheader.us.new ], [ %indvars.iv.next30.1, %for.body17.us ]
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %10 = mul nsw i64 %indvars.iv.next30, %indvars.iv34
  %11 = trunc i64 %10 to i32
  %rem20.us = srem i32 %11, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv29
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %12 = mul nsw i64 %indvars.iv.next30.1, %indvars.iv34
  %13 = trunc i64 %12 to i32
  %rem20.us.1 = srem i32 %13, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i1.1 = insertelement <2 x double> undef, double %conv22, i32 0
  %div23.us.v.i1.2 = insertelement <2 x double> %div23.us.v.i1.1, double %conv22, i32 1
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, %div23.us.v.i1.2
  %14 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %14, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next30, %wide.trip.count32
  br i1 %exitcond33.1, label %for.cond14.for.inc31_crit_edge.us.unr-lcssa, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.unr-lcssa:      ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us.prol.loopexit, %for.cond14.for.inc31_crit_edge.us.unr-lcssa
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %cmp11.us = icmp slt i64 %indvars.iv.next35, %6
  br i1 %cmp11.us, label %for.cond14.preheader.us, label %for.cond34.preheader.loopexit

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.loopexit, %for.cond10.preheader, %entry
  %cmp357 = icmp sgt i32 %nk, 0
  br i1 %cmp357, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %cmp396 = icmp sgt i32 %nj, 0
  %conv46 = sitofp i32 %nj to double
  br i1 %cmp396, label %for.cond38.preheader.us.preheader, label %for.end57

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %15 = add i32 %nj, -1
  %16 = sext i32 %nk to i64
  %wide.trip.count = zext i32 %15 to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.for.inc55_crit_edge.us, %for.cond38.preheader.us.preheader
  %indvars.iv26 = phi i64 [ 0, %for.cond38.preheader.us.preheader ], [ %indvars.iv.next27, %for.cond38.for.inc55_crit_edge.us ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body41.us ], [ 0, %for.cond38.preheader.us ]
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = mul nuw nsw i64 %17, %indvars.iv26
  %19 = trunc i64 %18 to i32
  %rem44.us = srem i32 %19, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv26, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.body41.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond50 = icmp ne i64 %indvars.iv.next27, %16
  br i1 %exitcond50, label %for.cond38.preheader.us, label %for.end57.loopexit

for.end57.loopexit:                               ; preds = %for.cond38.for.inc55_crit_edge.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond38.preheader.lr.ph, %for.cond34.preheader, %for.cond14.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #0 {
entry:
  %beta.addr = alloca double, align 8
  store double %beta, double* %beta.addr, align 8
  %cmp11 = icmp sgt i32 %ni, 0
  br i1 %cmp11, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp77 = icmp sgt i32 %nk, 0
  %cmp106 = icmp sgt i32 %nj, 0
  %0 = add i32 %nj, -1
  br i1 %cmp77, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %ni to i64
  %cmp25 = icmp sgt i32 %nj, 0
  %2 = load double, double* %beta.addr, align 8
  %wide.trip.count54 = zext i32 %0 to i64
  %3 = add nuw nsw i64 %wide.trip.count54, 1
  %4 = and i64 %3, 8589934588
  %5 = add nsw i64 %4, -4
  %6 = lshr exact i64 %5, 2
  %min.iters.check = icmp ult i64 %3, 4
  %n.vec = and i64 %3, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert61 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat62 = shufflevector <2 x double> %broadcast.splatinsert61, <2 x double> undef, <2 x i32> zeroinitializer
  %7 = and i64 %6, 1
  %lcmp.mod123 = icmp eq i64 %7, 0
  %8 = icmp eq i64 %6, 0
  %cmp.n = icmp eq i64 %3, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %9 = sext i32 %nk to i64
  %10 = sext i32 %ni to i64
  %cmp25.us = icmp sgt i32 %nj, 0
  %11 = load double, double* %beta.addr, align 8
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count46 = zext i32 %0 to i64
  %12 = add nuw nsw i64 %wide.trip.count46, 1
  %13 = and i64 %12, 8589934588
  %14 = add nsw i64 %13, -4
  %15 = lshr exact i64 %14, 2
  %16 = add nuw nsw i64 %wide.trip.count46, 1
  %min.iters.check101 = icmp ult i64 %12, 4
  %n.vec104 = and i64 %12, 8589934588
  %cmp.zero105 = icmp eq i64 %n.vec104, 0
  %broadcast.splatinsert117 = insertelement <2 x double> undef, double %11, i32 0
  %broadcast.splat118 = shufflevector <2 x double> %broadcast.splatinsert117, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = and i64 %15, 1
  %lcmp.mod = icmp eq i64 %17, 0
  %18 = icmp eq i64 %15, 0
  %cmp.n110 = icmp eq i64 %12, %n.vec104
  %min.iters.check66 = icmp ult i64 %12, 4
  %n.vec69 = and i64 %12, 8589934588
  %cmp.zero70 = icmp eq i64 %n.vec69, 0
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %alpha, i32 0
  %cmp.n87 = icmp eq i64 %12, %n.vec69
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond6.for.inc32_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next51, %for.cond6.for.inc32_crit_edge.us ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 0
  %scevgep73 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %12
  br i1 %cmp25.us, label %for.cond1.preheader.us.for.body3.us_crit_edge, label %for.cond9.preheader.lr.ph.us

for.cond1.preheader.us.for.body3.us_crit_edge:    ; preds = %for.cond1.preheader.us
  br i1 %min.iters.check101, label %for.body3.us.preheader, label %min.iters.checked102

min.iters.checked102:                             ; preds = %for.cond1.preheader.us.for.body3.us_crit_edge
  br i1 %cmp.zero105, label %for.body3.us.preheader, label %vector.ph106

vector.ph106:                                     ; preds = %min.iters.checked102
  br i1 %lcmp.mod, label %vector.body98.prol.preheader, label %vector.body98.prol.loopexit.unr-lcssa

vector.body98.prol.preheader:                     ; preds = %vector.ph106
  br label %vector.body98.prol

vector.body98.prol:                               ; preds = %vector.body98.prol.preheader
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 0
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load115.prol = load <2 x double>, <2 x double>* %20, align 8
  %21 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load116.prol = load <2 x double>, <2 x double>* %22, align 8
  %23 = fmul <2 x double> %broadcast.splat118, %wide.load115.prol
  %24 = fmul <2 x double> %broadcast.splat118, %wide.load116.prol
  %25 = bitcast double* %19 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8
  %26 = bitcast double* %21 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8
  br label %vector.body98.prol.loopexit.unr-lcssa

vector.body98.prol.loopexit.unr-lcssa:            ; preds = %vector.ph106, %vector.body98.prol
  %index107.unr.ph = phi i64 [ 4, %vector.body98.prol ], [ 0, %vector.ph106 ]
  br label %vector.body98.prol.loopexit

vector.body98.prol.loopexit:                      ; preds = %vector.body98.prol.loopexit.unr-lcssa
  br i1 %18, label %middle.block99, label %vector.ph106.new

vector.ph106.new:                                 ; preds = %vector.body98.prol.loopexit
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %vector.ph106.new
  %index107 = phi i64 [ %index107.unr.ph, %vector.ph106.new ], [ %index.next108.1, %vector.body98 ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %index107
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %30, align 8
  %31 = fmul <2 x double> %broadcast.splat118, %wide.load115
  %32 = fmul <2 x double> %broadcast.splat118, %wide.load116
  %33 = bitcast double* %27 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8
  %34 = bitcast double* %29 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8
  %index.next108 = add i64 %index107, 4
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %index.next108
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load115.1 = load <2 x double>, <2 x double>* %36, align 8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load116.1 = load <2 x double>, <2 x double>* %38, align 8
  %39 = fmul <2 x double> %broadcast.splat118, %wide.load115.1
  %40 = fmul <2 x double> %broadcast.splat118, %wide.load116.1
  %41 = bitcast double* %35 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8
  %42 = bitcast double* %37 to <2 x double>*
  store <2 x double> %40, <2 x double>* %42, align 8
  %index.next108.1 = add i64 %index107, 8
  %43 = icmp eq i64 %index.next108.1, %n.vec104
  br i1 %43, label %middle.block99.unr-lcssa, label %vector.body98, !llvm.loop !1

middle.block99.unr-lcssa:                         ; preds = %vector.body98
  br label %middle.block99

middle.block99:                                   ; preds = %vector.body98.prol.loopexit, %middle.block99.unr-lcssa
  br i1 %cmp.n110, label %for.cond9.preheader.lr.ph.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block99, %min.iters.checked102, %for.cond1.preheader.us.for.body3.us_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked102 ], [ 0, %for.cond1.preheader.us.for.body3.us_crit_edge ], [ %n.vec104, %middle.block99 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv
  %44 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %11, %44
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.lr.ph.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond9.preheader.lr.ph.us.loopexit:            ; preds = %for.body3.us
  br label %for.cond9.preheader.lr.ph.us

for.cond9.preheader.lr.ph.us:                     ; preds = %for.cond9.preheader.lr.ph.us.loopexit, %middle.block99, %for.cond1.preheader.us
  br i1 %cmp106, label %for.cond9.preheader.us.us.preheader, label %for.cond6.for.inc32_crit_edge.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond9.preheader.lr.ph.us
  br label %for.cond9.preheader.us.us

for.cond6.for.inc32_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc29_crit_edge.us.us
  br label %for.cond6.for.inc32_crit_edge.us

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond6.for.inc32_crit_edge.us.loopexit, %for.cond9.preheader.lr.ph.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond125 = icmp ne i64 %indvars.iv.next51, %10
  br i1 %exitcond125, label %for.cond1.preheader.us, label %for.end34.loopexit

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep75 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 0
  %scevgep77 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 %12
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv48
  br i1 %min.iters.check66, label %for.body11.us.us.preheader, label %min.iters.checked67

for.body11.us.us.preheader:                       ; preds = %middle.block64, %vector.memcheck, %min.iters.checked67, %for.cond9.preheader.us.us
  %indvars.iv44.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked67 ], [ 0, %for.cond9.preheader.us.us ], [ %n.vec69, %middle.block64 ]
  %45 = sub nsw i64 %16, %indvars.iv44.ph
  %xtraiter120 = and i64 %45, 1
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  br i1 %lcmp.mod121, label %for.body11.us.us.prol.loopexit.unr-lcssa, label %for.body11.us.us.prol.preheader

for.body11.us.us.prol.preheader:                  ; preds = %for.body11.us.us.preheader
  br label %for.body11.us.us.prol

for.body11.us.us.prol:                            ; preds = %for.body11.us.us.prol.preheader
  %46 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %46, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 %indvars.iv44.ph
  %47 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %47
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv44.ph
  %48 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %mul21.us.us.prol, %48
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  %indvars.iv.next45.prol = or i64 %indvars.iv44.ph, 1
  br label %for.body11.us.us.prol.loopexit.unr-lcssa

for.body11.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body11.us.us.preheader, %for.body11.us.us.prol
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %for.body11.us.us.prol ], [ %indvars.iv44.ph, %for.body11.us.us.preheader ]
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.body11.us.us.prol.loopexit.unr-lcssa
  %49 = icmp eq i64 %wide.trip.count46, %indvars.iv44.ph
  br i1 %49, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.body11.us.us.preheader.new

for.body11.us.us.preheader.new:                   ; preds = %for.body11.us.us.prol.loopexit
  br label %for.body11.us.us

min.iters.checked67:                              ; preds = %for.cond9.preheader.us.us
  br i1 %cmp.zero70, label %for.body11.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked67
  %bound0 = icmp ult double* %scevgep, %arrayidx15.us.us
  %bound1 = icmp ult double* %arrayidx15.us.us, %scevgep73
  %found.conflict = and i1 %bound0, %bound1
  %bound080 = icmp ult double* %scevgep, %scevgep77
  %bound181 = icmp ult double* %scevgep75, %scevgep73
  %found.conflict82 = and i1 %bound080, %bound181
  %conflict.rdx = or i1 %found.conflict, %found.conflict82
  br i1 %conflict.rdx, label %for.body11.us.us.preheader, label %vector.ph83

vector.ph83:                                      ; preds = %vector.memcheck
  br label %vector.body63

vector.body63:                                    ; preds = %vector.body63, %vector.ph83
  %index84 = phi i64 [ 0, %vector.ph83 ], [ %index.next85, %vector.body63 ]
  %50 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !6
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = insertelement <2 x double> undef, double %50, i32 0
  %53 = fmul <2 x double> %51, %broadcast.splatinsert92
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = fmul <2 x double> %52, %broadcast.splatinsert92
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 %index84
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !9
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !9
  %61 = fmul <2 x double> %54, %wide.load94
  %62 = fmul <2 x double> %56, %wide.load95
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %index84
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !11, !noalias !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !11, !noalias !13
  %67 = fadd <2 x double> %61, %wide.load96
  %68 = fadd <2 x double> %62, %wide.load97
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !11, !noalias !13
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !11, !noalias !13
  %index.next85 = add i64 %index84, 4
  %71 = icmp eq i64 %index.next85, %n.vec69
  br i1 %71, label %middle.block64, label %vector.body63, !llvm.loop !14

middle.block64:                                   ; preds = %vector.body63
  br i1 %cmp.n87, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.preheader

for.cond9.for.inc29_crit_edge.us.us.loopexit.unr-lcssa: ; preds = %for.body11.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us.loopexit

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us.prol.loopexit, %for.cond9.for.inc29_crit_edge.us.us.loopexit.unr-lcssa
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block64
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond124 = icmp ne i64 %indvars.iv.next49, %9
  br i1 %exitcond124, label %for.cond9.preheader.us.us, label %for.cond6.for.inc32_crit_edge.us.loopexit

for.body11.us.us:                                 ; preds = %for.body11.us.us, %for.body11.us.us.preheader.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr.ph, %for.body11.us.us.preheader.new ], [ %indvars.iv.next45.1, %for.body11.us.us ]
  %72 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %72, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 %indvars.iv44
  %73 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %73
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv44
  %74 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %mul21.us.us, %74
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %75 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %75, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 %indvars.iv.next45
  %76 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %76
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv.next45
  %77 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %mul21.us.us.1, %77
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %exitcond47.1 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  br i1 %exitcond47.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit.unr-lcssa, label %for.body11.us.us, !llvm.loop !15

for.cond1.preheader:                              ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv56 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next57, %for.inc32 ]
  br i1 %cmp25, label %for.cond1.preheader.for.body3_crit_edge, label %for.inc32

for.cond1.preheader.for.body3_crit_edge:          ; preds = %for.cond1.preheader
  br i1 %min.iters.check, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.for.body3_crit_edge
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 %lcmp.mod123, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %78 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv56, i64 0
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %79, align 8
  %80 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv56, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load60.prol = load <2 x double>, <2 x double>* %81, align 8
  %82 = fmul <2 x double> %broadcast.splat62, %wide.load.prol
  %83 = fmul <2 x double> %broadcast.splat62, %wide.load60.prol
  %84 = bitcast double* %78 to <2 x double>*
  store <2 x double> %82, <2 x double>* %84, align 8
  %85 = bitcast double* %80 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %8, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %86 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv56, i64 %index
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %87, align 8
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %89, align 8
  %90 = fmul <2 x double> %broadcast.splat62, %wide.load
  %91 = fmul <2 x double> %broadcast.splat62, %wide.load60
  %92 = bitcast double* %86 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8
  %93 = bitcast double* %88 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8
  %index.next = add i64 %index, 4
  %94 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv56, i64 %index.next
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %95, align 8
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load60.1 = load <2 x double>, <2 x double>* %97, align 8
  %98 = fmul <2 x double> %broadcast.splat62, %wide.load.1
  %99 = fmul <2 x double> %broadcast.splat62, %wide.load60.1
  %100 = bitcast double* %94 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8
  %101 = bitcast double* %96 to <2 x double>*
  store <2 x double> %99, <2 x double>* %101, align 8
  %index.next.1 = add i64 %index, 8
  %102 = icmp eq i64 %index.next.1, %n.vec
  br i1 %102, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !16

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc32, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.for.body3_crit_edge
  %indvars.iv52.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.for.body3_crit_edge ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.body3 ], [ %indvars.iv52.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv52
  %103 = load double, double* %arrayidx5, align 8
  %mul = fmul double %2, %103
  store double %mul, double* %arrayidx5, align 8
  %exitcond55 = icmp eq i64 %indvars.iv52, %wide.trip.count54
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br i1 %exitcond55, label %for.inc32.loopexit, label %for.body3, !llvm.loop !17

for.inc32.loopexit:                               ; preds = %for.body3
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block, %for.cond1.preheader
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond126 = icmp ne i64 %indvars.iv.next57, %1
  br i1 %exitcond126, label %for.cond1.preheader, label %for.end34.loopexit119

for.end34.loopexit:                               ; preds = %for.cond6.for.inc32_crit_edge.us
  br label %for.end34

for.end34.loopexit119:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit119, %for.end34.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nj, [1100 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %ni, 0
  %cmp32 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp4, %cmp32
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %nj to i64
  %4 = sext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv9, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp ne i64 %indvars.iv.next10, %4
  br i1 %exitcond12, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!7, !10}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !5, !2, !3}
