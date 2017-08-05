; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.body.lr.ph, label %entry.for.end29_crit_edge

entry.for.end29_crit_edge:                        ; preds = %entry
  br label %for.end29

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond11.for.end26_crit_edge.us.for.body.us_crit_edge, %for.body.us.preheader
  %indvars.iv19 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next20, %for.cond11.for.end26_crit_edge.us.for.body.us_crit_edge ]
  %cmp21.us = icmp sgt i64 %indvars.iv19, 0
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.body.us.for.end.us_crit_edge

for.body.us.for.end.us_crit_edge:                 ; preds = %for.body.us
  br label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.body3.us.prol.loopexit.unr-lcssa.for.end.us_crit_edge, %for.body.us.for.end.us_crit_edge, %for.end.us.loopexit
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv19
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %0 = trunc i64 %indvars.iv19 to i32
  %sub.us = add i32 %0, 1200
  br i1 true, label %for.end.us.for.body14.us.prol.loopexit.unr-lcssa_crit_edge, label %for.body14.us.prol.preheader

for.end.us.for.body14.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.end.us
  br label %for.body14.us.prol.loopexit.unr-lcssa

for.body14.us.prol.preheader:                     ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv19, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit.unr-lcssa

for.body14.us.prol.loopexit.unr-lcssa:            ; preds = %for.end.us.for.body14.us.prol.loopexit.unr-lcssa_crit_edge, %for.body14.us.prol.preheader
  %indvars.iv15.unr.ph = phi i64 [ 1, %for.body14.us.prol.preheader ], [ 0, %for.end.us.for.body14.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 false, label %for.body14.us.prol.loopexit.unr-lcssa.for.cond11.for.end26_crit_edge.us_crit_edge, label %for.body14.us.preheader

for.body14.us.prol.loopexit.unr-lcssa.for.cond11.for.end26_crit_edge.us_crit_edge: ; preds = %for.body14.us.prol.loopexit.unr-lcssa
  br label %for.cond11.for.end26_crit_edge.us

for.body14.us.preheader:                          ; preds = %for.body14.us.prol.loopexit.unr-lcssa
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.for.body14.us_crit_edge, %for.body14.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %for.body14.us.for.body14.us_crit_edge ], [ %indvars.iv15.unr.ph, %for.body14.us.preheader ]
  %1 = trunc i64 %indvars.iv15 to i32
  %add15.us = sub i32 %sub.us, %1
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv19, i64 %indvars.iv15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %2 = trunc i64 %indvars.iv.next16 to i32
  %add15.us.1 = sub i32 %sub.us, %2
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %3 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %3, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next16.1, 1200
  br i1 %exitcond33.1, label %for.cond11.for.end26_crit_edge.us.loopexit, label %for.body14.us.for.body14.us_crit_edge

for.body14.us.for.body14.us_crit_edge:            ; preds = %for.body14.us
  br label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %4 = add nuw nsw i64 %indvars.iv, %indvars.iv19
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = add nuw nsw i64 %indvars.iv.next, %indvars.iv19
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %8 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %8, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv19
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.body.us
  %xtraiter = and i64 %indvars.iv19, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.lr.ph.us.for.body3.us.prol.loopexit.unr-lcssa_crit_edge, label %for.body3.us.prol.preheader

for.body3.lr.ph.us.for.body3.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  %9 = trunc i64 %indvars.iv19 to i32
  %rem.us.prol = srem i32 %9, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv19, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.lr.ph.us.for.body3.us.prol.loopexit.unr-lcssa_crit_edge, %for.body3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol.preheader ], [ 0, %for.body3.lr.ph.us.for.body3.us.prol.loopexit.unr-lcssa_crit_edge ]
  %10 = icmp eq i64 %indvars.iv19, 1
  br i1 %10, label %for.body3.us.prol.loopexit.unr-lcssa.for.end.us_crit_edge, label %for.body3.us.preheader

for.body3.us.prol.loopexit.unr-lcssa.for.end.us_crit_edge: ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.end.us

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.body3.us

for.cond11.for.end26_crit_edge.us.loopexit:       ; preds = %for.body14.us
  br label %for.cond11.for.end26_crit_edge.us

for.cond11.for.end26_crit_edge.us:                ; preds = %for.body14.us.prol.loopexit.unr-lcssa.for.cond11.for.end26_crit_edge.us_crit_edge, %for.cond11.for.end26_crit_edge.us.loopexit
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond34, label %for.end29.loopexit, label %for.cond11.for.end26_crit_edge.us.for.body.us_crit_edge

for.cond11.for.end26_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond11.for.end26_crit_edge.us
  br label %for.body.us

for.body:                                         ; preds = %for.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv29 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next30, %for.end.for.body_crit_edge ]
  %cmp21 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp21, label %for.body3.lr.ph, label %for.body.for.end_crit_edge

for.body.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  %xtraiter38 = and i64 %indvars.iv29, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %for.body3.lr.ph.for.body3.prol.loopexit.unr-lcssa_crit_edge, label %for.body3.prol.preheader

for.body3.lr.ph.for.body3.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body3.lr.ph
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  %11 = trunc i64 %indvars.iv29 to i32
  %rem.prol = srem i32 %11, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.lr.ph.for.body3.prol.loopexit.unr-lcssa_crit_edge, %for.body3.prol.preheader
  %indvars.iv23.unr.ph = phi i64 [ 1, %for.body3.prol.preheader ], [ 0, %for.body3.lr.ph.for.body3.prol.loopexit.unr-lcssa_crit_edge ]
  %12 = icmp eq i64 %indvars.iv29, 1
  br i1 %12, label %for.body3.prol.loopexit.unr-lcssa.for.end_crit_edge, label %for.body3.preheader

for.body3.prol.loopexit.unr-lcssa.for.end_crit_edge: ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.end

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %for.body3.for.body3_crit_edge ], [ %indvars.iv23.unr.ph, %for.body3.preheader ]
  %13 = add nuw nsw i64 %indvars.iv23, %indvars.iv29
  %14 = trunc i64 %13 to i32
  %rem = srem i32 %14, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv23
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %15 = add nuw nsw i64 %indvars.iv.next24, %indvars.iv29
  %16 = trunc i64 %15 to i32
  %rem.1 = srem i32 %16, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %17 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %17, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv29
  br i1 %exitcond28.1, label %for.end.loopexit, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.body3.prol.loopexit.unr-lcssa.for.end_crit_edge, %for.body.for.end_crit_edge, %for.end.loopexit
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv29
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond35, label %for.end29.loopexit42, label %for.end.for.body_crit_edge

for.end.for.body_crit_edge:                       ; preds = %for.end
  br label %for.body

for.end29.loopexit:                               ; preds = %for.cond11.for.end26_crit_edge.us
  br label %for.end29

for.end29.loopexit42:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %entry.for.end29_crit_edge, %for.end29.loopexit42, %for.end29.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  br i1 true, label %for.body.us.preheader, label %entry.for.end32_crit_edge

entry.for.end32_crit_edge:                        ; preds = %entry
  br label %for.end32

for.body.us.preheader:                            ; preds = %entry
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us19.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.end29_crit_edge.us.for.body.us_crit_edge, %for.body.us.preheader
  %indvars.iv65 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next66, %for.cond1.for.end29_crit_edge.us.for.body.us_crit_edge ]
  %indvars.iv51 = phi i64 [ 1, %for.body.us.preheader ], [ %indvars.iv.next52, %for.cond1.for.end29_crit_edge.us.for.body.us_crit_edge ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %cmp51.us = icmp slt i64 %indvars.iv.next66, 1000
  br i1 %cmp51.us, label %for.body3.us.us.preheader, label %for.body3.us13.preheader

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %1 = sub i64 1001, %indvars.iv65
  %xtraiter73 = and i64 %1, 1
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv65
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv51, 1
  %2 = icmp eq i64 %xtraiter73, 0
  %3 = icmp eq i64 998, %indvars.iv65
  br label %for.body3.us.us

for.body3.us13.preheader:                         ; preds = %for.body.us
  br i1 true, label %for.body3.us13.preheader.for.body3.us13.prol.loopexit_crit_edge, label %for.body3.us13.prol.preheader

for.body3.us13.preheader.for.body3.us13.prol.loopexit_crit_edge: ; preds = %for.body3.us13.preheader
  br label %for.body3.us13.prol.loopexit

for.body3.us13.prol.preheader:                    ; preds = %for.body3.us13.preheader
  br label %for.body3.us13.prol

for.body3.us13.prol:                              ; preds = %for.body3.us13.prol.for.body3.us13.prol_crit_edge, %for.body3.us13.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us13.prol.for.body3.us13.prol_crit_edge ], [ 0, %for.body3.us13.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us13.prol.for.body3.us13.prol_crit_edge ], [ 0, %for.body3.us13.prol.preheader ]
  %arrayidx21.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv.prol
  %4 = load double, double* %arrayidx21.us18.prol, align 8
  %mul22.us19.prol = fmul double %4, %alpha
  store double %mul22.us19.prol, double* %arrayidx21.us18.prol, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us13.prol.loopexit.loopexit, label %for.body3.us13.prol.for.body3.us13.prol_crit_edge, !llvm.loop !1

for.body3.us13.prol.for.body3.us13.prol_crit_edge: ; preds = %for.body3.us13.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.body3.us13.prol

for.body3.us13.prol.loopexit.loopexit:            ; preds = %for.body3.us13.prol
  br label %for.body3.us13.prol.loopexit

for.body3.us13.prol.loopexit:                     ; preds = %for.body3.us13.preheader.for.body3.us13.prol.loopexit_crit_edge, %for.body3.us13.prol.loopexit.loopexit
  br i1 false, label %for.body3.us13.prol.loopexit.for.cond1.for.end29_crit_edge.us_crit_edge, label %for.body3.us13.preheader78

for.body3.us13.prol.loopexit.for.cond1.for.end29_crit_edge.us_crit_edge: ; preds = %for.body3.us13.prol.loopexit
  br label %for.cond1.for.end29_crit_edge.us

for.body3.us13.preheader78:                       ; preds = %for.body3.us13.prol.loopexit
  br i1 false, label %for.body3.us13.prol.preheader80, label %for.body3.us13.preheader78.for.body3.us13.prol.loopexit81.unr-lcssa_crit_edge

for.body3.us13.preheader78.for.body3.us13.prol.loopexit81.unr-lcssa_crit_edge: ; preds = %for.body3.us13.preheader78
  br label %for.body3.us13.prol.loopexit81.unr-lcssa

for.body3.us13.prol.preheader80:                  ; preds = %for.body3.us13.preheader78
  br label %for.body3.us13.prol83

for.body3.us13.prol83:                            ; preds = %for.body3.us13.prol.preheader80
  %arrayidx21.us18.prol85 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 0
  %5 = bitcast double* %arrayidx21.us18.prol85 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul22.us19.prol86 = fmul <2 x double> %6, %mul22.us19.v.i1.2
  store <2 x double> %mul22.us19.prol86, <2 x double>* %5, align 8
  %arrayidx21.us18.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 2
  %7 = bitcast double* %arrayidx21.us18.2.prol to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul22.us19.2.prol = fmul <2 x double> %8, %mul22.us19.v.i1.2
  store <2 x double> %mul22.us19.2.prol, <2 x double>* %7, align 8
  br label %for.body3.us13.prol.loopexit81.unr-lcssa

for.body3.us13.prol.loopexit81.unr-lcssa:         ; preds = %for.body3.us13.preheader78.for.body3.us13.prol.loopexit81.unr-lcssa_crit_edge, %for.body3.us13.prol83
  %indvars.iv.unr87.ph = phi i64 [ 4, %for.body3.us13.prol83 ], [ 0, %for.body3.us13.preheader78.for.body3.us13.prol.loopexit81.unr-lcssa_crit_edge ]
  br label %for.body3.us13.prol.loopexit81

for.body3.us13.prol.loopexit81:                   ; preds = %for.body3.us13.prol.loopexit81.unr-lcssa
  br i1 false, label %for.body3.us13.prol.loopexit81.for.cond1.for.end29_crit_edge.us.loopexit79_crit_edge, label %for.body3.us13.preheader78.new

for.body3.us13.prol.loopexit81.for.cond1.for.end29_crit_edge.us.loopexit79_crit_edge: ; preds = %for.body3.us13.prol.loopexit81
  br label %for.cond1.for.end29_crit_edge.us.loopexit79

for.body3.us13.preheader78.new:                   ; preds = %for.body3.us13.prol.loopexit81
  br label %for.body3.us13

for.body3.us13:                                   ; preds = %for.body3.us13.for.body3.us13_crit_edge, %for.body3.us13.preheader78.new
  %indvars.iv = phi i64 [ %indvars.iv.unr87.ph, %for.body3.us13.preheader78.new ], [ %indvars.iv.next.3.1, %for.body3.us13.for.body3.us13_crit_edge ]
  %arrayidx21.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv
  %9 = bitcast double* %arrayidx21.us18 to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul22.us19 = fmul <2 x double> %10, %mul22.us19.v.i1.2
  store <2 x double> %mul22.us19, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us18.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %11 = bitcast double* %arrayidx21.us18.2 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul22.us19.2 = fmul <2 x double> %12, %mul22.us19.v.i1.2
  store <2 x double> %mul22.us19.2, <2 x double>* %11, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx21.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv.next.3
  %13 = bitcast double* %arrayidx21.us18.1 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %mul22.us19.1 = fmul <2 x double> %14, %mul22.us19.v.i1.2
  store <2 x double> %mul22.us19.1, <2 x double>* %13, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx21.us18.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv.next.1.1
  %15 = bitcast double* %arrayidx21.us18.2.1 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %mul22.us19.2.1 = fmul <2 x double> %16, %mul22.us19.v.i1.2
  store <2 x double> %mul22.us19.2.1, <2 x double>* %15, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond70.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond70.3.1, label %for.cond1.for.end29_crit_edge.us.loopexit79.unr-lcssa, label %for.body3.us13.for.body3.us13_crit_edge

for.body3.us13.for.body3.us13_crit_edge:          ; preds = %for.body3.us13
  br label %for.body3.us13

for.cond1.for.end29_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.end29_crit_edge.us

for.cond1.for.end29_crit_edge.us.loopexit79.unr-lcssa: ; preds = %for.body3.us13
  br label %for.cond1.for.end29_crit_edge.us.loopexit79

for.cond1.for.end29_crit_edge.us.loopexit79:      ; preds = %for.body3.us13.prol.loopexit81.for.cond1.for.end29_crit_edge.us.loopexit79_crit_edge, %for.cond1.for.end29_crit_edge.us.loopexit79.unr-lcssa
  br label %for.cond1.for.end29_crit_edge.us

for.cond1.for.end29_crit_edge.us:                 ; preds = %for.body3.us13.prol.loopexit.for.cond1.for.end29_crit_edge.us_crit_edge, %for.cond1.for.end29_crit_edge.us.loopexit79, %for.cond1.for.end29_crit_edge.us.loopexit
  %exitcond72 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond72, label %for.end32.loopexit, label %for.cond1.for.end29_crit_edge.us.for.body.us_crit_edge

for.cond1.for.end29_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond1.for.end29_crit_edge.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br label %for.body.us

for.body3.us.us:                                  ; preds = %for.cond4.for.end_crit_edge.us.us.for.body3.us.us_crit_edge, %for.body3.us.us.preheader
  %indvars.iv61 = phi i64 [ 0, %for.body3.us.us.preheader ], [ %indvars.iv.next62, %for.cond4.for.end_crit_edge.us.us.for.body3.us.us_crit_edge ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv61
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br i1 %2, label %for.body3.us.us.for.body6.us.us.prol.loopexit.unr-lcssa_crit_edge, label %for.body6.us.us.prol.preheader

for.body3.us.us.for.body6.us.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body3.us.us
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  %17 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv61
  %18 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %17, %18
  %add17.us.us.prol = fadd double %mul.us.us.prol, %.pre
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us.for.body6.us.us.prol.loopexit.unr-lcssa_crit_edge, %for.body6.us.us.prol.preheader
  %add17.us.us.lcssa.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol.preheader ], [ undef, %for.body3.us.us.for.body6.us.us.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv53.unr.ph = phi i64 [ %indvars.iv.next54.prol, %for.body6.us.us.prol.preheader ], [ %indvars.iv51, %for.body3.us.us.for.body6.us.us.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol.preheader ], [ %.pre, %for.body3.us.us.for.body6.us.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %3, label %for.body6.us.us.prol.loopexit.unr-lcssa.for.cond4.for.end_crit_edge.us.us_crit_edge, label %for.body6.us.us.preheader

for.body6.us.us.prol.loopexit.unr-lcssa.for.cond4.for.end_crit_edge.us.us_crit_edge: ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br label %for.cond4.for.end_crit_edge.us.us

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa.for.cond4.for.end_crit_edge.us.us_crit_edge, %for.cond4.for.end_crit_edge.us.us.loopexit
  %add17.us.us.lcssa = phi double [ %add17.us.us.lcssa.unr.ph, %for.body6.us.us.prol.loopexit.unr-lcssa.for.cond4.for.end_crit_edge.us.us_crit_edge ], [ %add17.us.us.1, %for.cond4.for.end_crit_edge.us.us.loopexit ]
  %mul22.us.us = fmul double %add17.us.us.lcssa, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond71, label %for.cond1.for.end29_crit_edge.us.loopexit, label %for.cond4.for.end_crit_edge.us.us.for.body3.us.us_crit_edge

for.cond4.for.end_crit_edge.us.us.for.body3.us.us_crit_edge: ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %for.body6.us.us.for.body6.us.us_crit_edge ], [ %indvars.iv53.unr.ph, %for.body6.us.us.preheader ]
  %19 = phi double [ %add17.us.us.1, %for.body6.us.us.for.body6.us.us_crit_edge ], [ %.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv65
  %20 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv61
  %21 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %20, %21
  %add17.us.us = fadd double %mul.us.us, %19
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next54, i64 %indvars.iv65
  %22 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next54, i64 %indvars.iv61
  %23 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %22, %23
  %add17.us.us.1 = fadd double %mul.us.us.1, %add17.us.us
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next54.1, 1000
  br i1 %exitcond.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  br label %for.body6.us.us

for.end32.loopexit:                               ; preds = %for.cond1.for.end29_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %entry.for.end32_crit_edge, %for.end32.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.end_crit_edge.us.for.body.us_crit_edge, %for.body.us.preheader
  %indvars.iv11 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next12, %for.cond2.for.end_crit_edge.us.for.body.us_crit_edge ]
  %3 = mul nsw i64 1000, %indvars.iv11
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us.for.body4.us_crit_edge ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond17, label %for.cond2.for.end_crit_edge.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.for.end_crit_edge.us.for.body.us_crit_edge

for.cond2.for.end_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.end12.loopexit
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
