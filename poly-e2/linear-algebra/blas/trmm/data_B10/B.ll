; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  call void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.body.lr.ph, label %for.end29

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond11.for.end26_crit_edge.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.cond11.for.end26_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %0 = add i64 %indvars.iv18, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv18, 0
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us.prol.loopexit, %for.body.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv18
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %1 = trunc i64 %indvars.iv18 to i32
  %sub.us = add i32 %1, 1200
  br i1 true, label %for.body14.us.prol.loopexit, label %for.body14.us.prol

for.body14.us.prol:                               ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv18, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.body14.us.prol, %for.end.us
  %indvars.iv9.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br i1 false, label %for.cond11.for.end26_crit_edge.us, label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.body14.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %for.body14.us ], [ %indvars.iv9.unr.ph, %for.body14.us.preheader ]
  %2 = trunc i64 %indvars.iv9 to i32
  %add15.us = sub i32 %sub.us, %2
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv18, i64 %indvars.iv9
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %3 = trunc i64 %indvars.iv.next10 to i32
  %add15.us.1 = sub i32 %sub.us, %3
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %4 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %4, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond.115 = icmp eq i64 %indvars.iv.next10.1, 1200
  br i1 %exitcond.115, label %for.cond11.for.end26_crit_edge.us.loopexit, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv18
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv18
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %9 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.body.us
  %xtraiter36 = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter36, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.lr.ph.us
  %10 = trunc i64 %indvars.iv18 to i32
  %rem.us.prol = srem i32 %10, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv18, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.lr.ph.us ]
  %11 = trunc i64 %0 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.cond11.for.end26_crit_edge.us.loopexit:       ; preds = %for.body14.us
  br label %for.cond11.for.end26_crit_edge.us

for.cond11.for.end26_crit_edge.us:                ; preds = %for.cond11.for.end26_crit_edge.us.loopexit, %for.body14.us.prol.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond, label %for.end29.loopexit, label %for.body.us

for.body:                                         ; preds = %for.body.preheader, %for.end
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.end ], [ 0, %for.body.preheader ]
  %13 = add i64 %indvars.iv31, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv31, 0
  br i1 %cmp21, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.body
  %xtraiter2735 = and i64 %indvars.iv31, 1
  %lcmp.mod28 = icmp eq i64 %xtraiter2735, 0
  br i1 %lcmp.mod28, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.lr.ph
  %14 = trunc i64 %indvars.iv31 to i32
  %rem.prol = srem i32 %14, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.lr.ph
  %indvars.iv21.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.lr.ph ]
  %15 = trunc i64 %13 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %for.body3 ], [ %indvars.iv21.unr.ph, %for.body3.preheader ]
  %17 = add nuw nsw i64 %indvars.iv21, %indvars.iv31
  %18 = trunc i64 %17 to i32
  %rem = srem i32 %18, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv21
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %19 = add nuw nsw i64 %indvars.iv.next22, %indvars.iv31
  %20 = trunc i64 %19 to i32
  %rem.1 = srem i32 %20, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %21 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %21, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv31
  br i1 %exitcond26.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.body
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %for.end29.loopexit39, label %for.body

for.end29.loopexit:                               ; preds = %for.cond11.for.end26_crit_edge.us
  br label %for.end29

for.end29.loopexit39:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit39, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  br i1 true, label %for.body.us.preheader, label %for.end32

for.body.us.preheader:                            ; preds = %entry
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us13.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.end29_crit_edge.us, %for.body.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next54, %for.cond1.for.end29_crit_edge.us ]
  %indvars.iv38 = phi i64 [ 1, %for.body.us.preheader ], [ %indvars.iv.next39, %for.cond1.for.end29_crit_edge.us ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %cmp51.us = icmp slt i64 %indvars.iv.next54, 1000
  br i1 %cmp51.us, label %for.body3.us.us.preheader, label %for.body3.us8.preheader

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %1 = sub nsw i64 0, %indvars.iv53
  %2 = trunc i64 %1 to i32
  %3 = add i32 1001, %2
  %xtraiter47 = and i32 %3, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %4 = sub i32 0, %2
  %5 = icmp eq i32 998, %4
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv53
  %indvars.iv.next41.prol = add nuw nsw i64 %indvars.iv38, 1
  br label %for.body3.us.us

for.body3.us8.preheader:                          ; preds = %for.body.us
  br i1 true, label %for.body3.us8.prol.loopexit, label %for.body3.us8.prol.preheader

for.body3.us8.prol.preheader:                     ; preds = %for.body3.us8.preheader
  br label %for.body3.us8.prol

for.body3.us8.prol:                               ; preds = %for.body3.us8.prol.preheader, %for.body3.us8.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us8.prol ], [ 0, %for.body3.us8.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us8.prol ], [ 0, %for.body3.us8.prol.preheader ]
  %arrayidx21.us12.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.prol
  %6 = load double, double* %arrayidx21.us12.prol, align 8
  %mul22.us13.prol = fmul double %6, %alpha
  store double %mul22.us13.prol, double* %arrayidx21.us12.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us8.prol.loopexit.loopexit, label %for.body3.us8.prol, !llvm.loop !1

for.body3.us8.prol.loopexit.loopexit:             ; preds = %for.body3.us8.prol
  br label %for.body3.us8.prol.loopexit

for.body3.us8.prol.loopexit:                      ; preds = %for.body3.us8.prol.loopexit.loopexit, %for.body3.us8.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us8.preheader ], [ %indvars.iv.next.prol, %for.body3.us8.prol.loopexit.loopexit ]
  br i1 false, label %for.cond1.for.end29_crit_edge.us, label %for.body3.us8.preheader64

for.body3.us8.preheader64:                        ; preds = %for.body3.us8.prol.loopexit
  %7 = sub i64 1196, %indvars.iv.unr
  %8 = lshr i64 %7, 2
  %9 = and i64 %8, 1
  %lcmp.mod69 = icmp eq i64 %9, 0
  br i1 %lcmp.mod69, label %for.body3.us8.prol.preheader66, label %for.body3.us8.prol.loopexit67.unr-lcssa

for.body3.us8.prol.preheader66:                   ; preds = %for.body3.us8.preheader64
  br label %for.body3.us8.prol70

for.body3.us8.prol70:                             ; preds = %for.body3.us8.prol.preheader66
  %arrayidx21.us12.prol72 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.unr
  %10 = bitcast double* %arrayidx21.us12.prol72 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul22.us13.prol73 = fmul <2 x double> %11, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.prol73, <2 x double>* %10, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %arrayidx21.us12.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.next.1.prol
  %12 = bitcast double* %arrayidx21.us12.2.prol to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul22.us13.2.prol = fmul <2 x double> %13, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.2.prol, <2 x double>* %12, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.body3.us8.prol.loopexit67.unr-lcssa

for.body3.us8.prol.loopexit67.unr-lcssa:          ; preds = %for.body3.us8.preheader64, %for.body3.us8.prol70
  %indvars.iv.unr74.ph = phi i64 [ %indvars.iv.next.3.prol, %for.body3.us8.prol70 ], [ %indvars.iv.unr, %for.body3.us8.preheader64 ]
  br label %for.body3.us8.prol.loopexit67

for.body3.us8.prol.loopexit67:                    ; preds = %for.body3.us8.prol.loopexit67.unr-lcssa
  %14 = icmp eq i64 %8, 0
  br i1 %14, label %for.cond1.for.end29_crit_edge.us.loopexit65, label %for.body3.us8.preheader64.new

for.body3.us8.preheader64.new:                    ; preds = %for.body3.us8.prol.loopexit67
  br label %for.body3.us8

for.body3.us8:                                    ; preds = %for.body3.us8, %for.body3.us8.preheader64.new
  %indvars.iv = phi i64 [ %indvars.iv.unr74.ph, %for.body3.us8.preheader64.new ], [ %indvars.iv.next.3.1, %for.body3.us8 ]
  %arrayidx21.us12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv
  %15 = bitcast double* %arrayidx21.us12 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %mul22.us13 = fmul <2 x double> %16, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us12.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %17 = bitcast double* %arrayidx21.us12.2 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul22.us13.2 = fmul <2 x double> %18, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.2, <2 x double>* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx21.us12.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.next.3
  %19 = bitcast double* %arrayidx21.us12.1 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul22.us13.1 = fmul <2 x double> %20, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.1, <2 x double>* %19, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx21.us12.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.next.1.1
  %21 = bitcast double* %arrayidx21.us12.2.1 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %mul22.us13.2.1 = fmul <2 x double> %22, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.2.1, <2 x double>* %21, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.cond1.for.end29_crit_edge.us.loopexit65.unr-lcssa, label %for.body3.us8

for.cond1.for.end29_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.end29_crit_edge.us

for.cond1.for.end29_crit_edge.us.loopexit65.unr-lcssa: ; preds = %for.body3.us8
  br label %for.cond1.for.end29_crit_edge.us.loopexit65

for.cond1.for.end29_crit_edge.us.loopexit65:      ; preds = %for.body3.us8.prol.loopexit67, %for.cond1.for.end29_crit_edge.us.loopexit65.unr-lcssa
  br label %for.cond1.for.end29_crit_edge.us

for.cond1.for.end29_crit_edge.us:                 ; preds = %for.cond1.for.end29_crit_edge.us.loopexit65, %for.cond1.for.end29_crit_edge.us.loopexit, %for.body3.us8.prol.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1000
  br i1 %exitcond56, label %for.end32.loopexit, label %for.body.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %lcmp.mod48, label %for.body3.us.us.for.body6.us.us.prol.loopexit_crit_edge, label %for.body6.us.us.prol

for.body3.us.us.for.body6.us.us.prol.loopexit_crit_edge: ; preds = %for.body3.us.us
  %.pre62.pre = load double, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol:                             ; preds = %for.body3.us.us
  %23 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv38, i64 %indvars.iv50
  %24 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %23, %24
  %25 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %25, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body3.us.us.for.body6.us.us.prol.loopexit_crit_edge, %for.body6.us.us.prol
  %.pre62 = phi double [ %add17.us.us.prol, %for.body6.us.us.prol ], [ %.pre62.pre, %for.body3.us.us.for.body6.us.us.prol.loopexit_crit_edge ]
  %indvars.iv40.unr.ph = phi i64 [ %indvars.iv.next41.prol, %for.body6.us.us.prol ], [ %indvars.iv38, %for.body3.us.us.for.body6.us.us.prol.loopexit_crit_edge ]
  br i1 %5, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.cond4.for.end_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %26 = phi double [ %.pre62, %for.body6.us.us.prol.loopexit ], [ %add17.us.us.1, %for.cond4.for.end_crit_edge.us.us.loopexit ]
  %mul22.us.us = fmul double %26, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond, label %for.cond1.for.end29_crit_edge.us.loopexit, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %27 = phi double [ %add17.us.us.1, %for.body6.us.us ], [ %.pre62, %for.body6.us.us.preheader ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %for.body6.us.us ], [ %indvars.iv40.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv53
  %28 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv50
  %29 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %28, %29
  %add17.us.us = fadd double %27, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next41, i64 %indvars.iv53
  %30 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next41, i64 %indvars.iv50
  %31 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %30, %31
  %add17.us.us.1 = fadd double %add17.us.us, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next41.1, 1000
  br i1 %exitcond.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end32.loopexit:                               ; preds = %for.cond1.for.end29_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %B) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.end_crit_edge.us, %for.body.us.preheader
  %indvars.iv6 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next7, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv6, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond10, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
