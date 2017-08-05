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
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %entry, %for.cond11.for.end26_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond11.for.end26_crit_edge.us ], [ 0, %entry ]
  %0 = add nuw i64 %indvars.iv24, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv24, 0
  %1 = trunc i64 %indvars.iv24 to i32
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body.us, %for.body3.us.prol.loopexit.unr-lcssa
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv24
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %sub.us = add i32 %1, 1200
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.end.us, %for.body14.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %for.body14.us ], [ 0, %for.end.us ]
  %2 = trunc i64 %indvars.iv15 to i32
  %add15.us = sub i32 %sub.us, %2
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv24, i64 %indvars.iv15
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = or i32 %3, 1
  %add15.us.1 = sub i32 %sub.us, %4
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %5 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %5, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond.121 = icmp eq i64 %indvars.iv.next16.1, 1200
  br i1 %exitcond.121, label %for.cond11.for.end26_crit_edge.us, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %6 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %9 = trunc i64 %8 to i32
  %rem.us.1 = srem i32 %9, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %10 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.body.us
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit.unr-lcssa, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  %rem.us.prol = srem i32 %1, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.lr.ph.us, %for.body3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol.preheader ], [ 0, %for.body3.lr.ph.us ]
  %11 = trunc i64 %0 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.body3.us

for.cond11.for.end26_crit_edge.us:                ; preds = %for.body14.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond, label %for.end29, label %for.body.us

for.end29:                                        ; preds = %for.cond11.for.end26_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us19.v.i0.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.end29_crit_edge.us, %entry
  %indvars.iv66 = phi i64 [ 0, %entry ], [ %indvars.iv.next67, %for.cond1.for.end29_crit_edge.us ]
  %indvars.iv51 = phi i64 [ 1, %entry ], [ %indvars.iv.next52.pre-phi, %for.cond1.for.end29_crit_edge.us ]
  %1 = sub nsw i64 0, %indvars.iv66
  %2 = trunc i64 %1 to i32
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %cmp51.us = icmp slt i64 %indvars.iv.next67, 1000
  br i1 %cmp51.us, label %for.body3.us.us.preheader, label %for.body3.us13.preheader

for.body3.us13.preheader:                         ; preds = %for.body.us
  br label %for.body3.us13

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %3 = and i32 %2, 1
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv66
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv51, 1
  %4 = icmp eq i32 %3, 0
  %5 = icmp eq i32 %2, -998
  br label %for.body3.us.us

for.body3.us13:                                   ; preds = %for.body3.us13, %for.body3.us13.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.us13.preheader ], [ %indvars.iv.next.3.1, %for.body3.us13 ]
  %arrayidx21.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv
  %6 = bitcast double* %arrayidx21.us18 to <2 x double>*
  %7 = load <2 x double>, <2 x double>* %6, align 8
  %mul22.us19 = fmul <2 x double> %mul22.us19.v.i0.2, %7
  store <2 x double> %mul22.us19, <2 x double>* %6, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx21.us18.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv.next.1
  %8 = bitcast double* %arrayidx21.us18.2 to <2 x double>*
  %9 = load <2 x double>, <2 x double>* %8, align 8
  %mul22.us19.2 = fmul <2 x double> %mul22.us19.v.i0.2, %9
  store <2 x double> %mul22.us19.2, <2 x double>* %8, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %arrayidx21.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv.next.3
  %10 = bitcast double* %arrayidx21.us18.1 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul22.us19.1 = fmul <2 x double> %mul22.us19.v.i0.2, %11
  store <2 x double> %mul22.us19.1, <2 x double>* %10, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %arrayidx21.us18.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv.next.1.1
  %12 = bitcast double* %arrayidx21.us18.2.1 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul22.us19.2.1 = fmul <2 x double> %mul22.us19.v.i0.2, %13
  store <2 x double> %mul22.us19.2.1, <2 x double>* %12, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.body3.us13.for.cond1.for.end29_crit_edge.us_crit_edge, label %for.body3.us13

for.body3.us13.for.cond1.for.end29_crit_edge.us_crit_edge: ; preds = %for.body3.us13
  %.pre76 = add nuw nsw i64 %indvars.iv51, 1
  br label %for.cond1.for.end29_crit_edge.us

for.cond1.for.end29_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.end29_crit_edge.us

for.cond1.for.end29_crit_edge.us:                 ; preds = %for.cond1.for.end29_crit_edge.us.loopexit, %for.body3.us13.for.cond1.for.end29_crit_edge.us_crit_edge
  %indvars.iv.next52.pre-phi = phi i64 [ %.pre76, %for.body3.us13.for.cond1.for.end29_crit_edge.us_crit_edge ], [ %indvars.iv.next54.prol, %for.cond1.for.end29_crit_edge.us.loopexit ]
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond69, label %for.end32, label %for.body.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv63
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br i1 %4, label %for.body6.us.us.prol.preheader, label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  %14 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv63
  %15 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %14, %15
  %add17.us.us.prol = fadd double %mul.us.us.prol, %.pre
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us, %for.body6.us.us.prol.preheader
  %indvars.iv53.unr.ph = phi i64 [ %indvars.iv.next54.prol, %for.body6.us.us.prol.preheader ], [ %indvars.iv51, %for.body3.us.us ]
  %.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol.preheader ], [ %.pre, %for.body3.us.us ]
  %add17.us.us.lcssa.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol.preheader ], [ undef, %for.body3.us.us ]
  br i1 %5, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.cond4.for.end_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit.unr-lcssa
  %add17.us.us.lcssa = phi double [ %add17.us.us.lcssa.unr.ph, %for.body6.us.us.prol.loopexit.unr-lcssa ], [ %add17.us.us.1, %for.cond4.for.end_crit_edge.us.us.loopexit ]
  %mul22.us.us = fmul double %add17.us.us.lcssa, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond, label %for.cond1.for.end29_crit_edge.us.loopexit, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %for.body6.us.us ], [ %indvars.iv53.unr.ph, %for.body6.us.us.preheader ]
  %16 = phi double [ %add17.us.us.1, %for.body6.us.us ], [ %.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv66
  %17 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv63
  %18 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %17, %18
  %add17.us.us = fadd double %mul.us.us, %16
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next54, i64 %indvars.iv66
  %19 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next54, i64 %indvars.iv63
  %20 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %19, %20
  %add17.us.us.1 = fadd double %mul.us.us.1, %add17.us.us
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next54.1, 1000
  br i1 %exitcond.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end32:                                        ; preds = %for.cond1.for.end29_crit_edge.us
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
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv11, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond15, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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
