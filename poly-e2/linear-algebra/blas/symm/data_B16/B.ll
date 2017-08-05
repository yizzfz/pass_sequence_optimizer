; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %B.addr = alloca [1200 x double]*, align 8
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp13 = icmp sgt i32 %m, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph, label %for.end53

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp212 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  %0 = load [1200 x double]*, [1200 x double]** %B.addr, align 8
  br i1 %cmp212, label %for.cond1.preheader.us.preheader, label %for.cond23.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %n, -1
  %2 = zext i32 %n to i64
  %3 = sext i32 %m to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv33 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34, %for.cond1.for.inc16_crit_edge.us ]
  %4 = add nuw nsw i64 %indvars.iv33, %2
  %5 = trunc i64 %4 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %6 = add nuw nsw i64 %indvars.iv29, %indvars.iv33
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv33, i64 %indvars.iv29
  store double %div.us, double* %arrayidx6.us, align 8
  %8 = trunc i64 %indvars.iv29 to i32
  %sub.us = sub i32 %5, %8
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, %conv4
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv29
  store double %div11.us, double* %arrayidx15.us, align 8
  %exitcond32 = icmp eq i64 %indvars.iv29, %wide.trip.count
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  br i1 %exitcond32, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp ne i64 %indvars.iv.next34, %3
  br i1 %exitcond, label %for.cond1.preheader.us, label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  %cmp209 = icmp sgt i32 %m, 0
  br i1 %cmp209, label %for.cond23.preheader.lr.ph, label %for.end53

for.cond23.preheader.lr.ph:                       ; preds = %for.cond19.preheader, %for.cond1.preheader.lr.ph
  %conv30 = sitofp i32 %m to double
  %9 = add i32 %m, -1
  %10 = sext i32 %m to i64
  %11 = sext i32 %m to i64
  %wide.trip.count25 = sext i32 %9 to i64
  %12 = add i64 %wide.trip.count25, -4
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.inc51, %for.cond23.preheader.lr.ph
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.inc51 ], [ 1, %for.cond23.preheader.lr.ph ]
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.inc51 ], [ %12, %for.cond23.preheader.lr.ph ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc51 ], [ 0, %for.cond23.preheader.lr.ph ]
  %13 = lshr i64 %indvars.iv43, 2
  %14 = add i64 %13, 1
  %15 = trunc i64 %14 to i2
  %16 = zext i2 %15 to i64
  %17 = shl i64 %16, 2
  %18 = sub nsw i64 %wide.trip.count25, %indvars.iv27
  %19 = add i64 %18, -4
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %22 = sub nsw i64 %wide.trip.count25, %indvars.iv27
  %23 = and i64 %indvars.iv27, 1
  %lcmp.mod = icmp eq i64 %23, 0
  br i1 %lcmp.mod, label %for.body26.prol.preheader, label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  br label %for.body26.prol

for.body26.prol:                                  ; preds = %for.body26.prol.preheader
  %24 = trunc i64 %indvars.iv27 to i32
  %rem28.prol = srem i32 %24, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv30
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.lr.ph ]
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol.loopexit.unr-lcssa
  %25 = icmp eq i64 %indvars.iv27, 0
  br i1 %25, label %for.cond40.preheader, label %for.body26.lr.ph.new

for.body26.lr.ph.new:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader.unr-lcssa:                   ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.body26.prol.loopexit, %for.cond40.preheader.unr-lcssa
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %cmp417 = icmp slt i64 %indvars.iv.next28, %10
  br i1 %cmp417, label %for.cond40.preheader.for.body43_crit_edge, label %for.inc51

for.cond40.preheader.for.body43_crit_edge:        ; preds = %for.cond40.preheader
  %min.iters.check = icmp ult i64 %22, 4
  br i1 %min.iters.check, label %for.body43.preheader, label %min.iters.checked

for.body43.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.cond40.preheader.for.body43_crit_edge
  %indvars.iv23.ph = phi i64 [ %indvars.iv45, %min.iters.checked ], [ %indvars.iv45, %for.cond40.preheader.for.body43_crit_edge ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.cond40.preheader.for.body43_crit_edge
  %n.vec = and i64 %22, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv45, %n.vec
  br i1 %cmp.zero, label %for.body43.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter41 = and i64 %21, 3
  %lcmp.mod42 = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod42, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter41, %vector.body.prol.preheader ]
  %26 = add nuw nsw i64 %indvars.iv45, %index.prol
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %30, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %17, %vector.body.prol.loopexit.unr-lcssa ]
  %31 = icmp ult i64 %19, 12
  br i1 %31, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %32 = add i64 %indvars.iv45, %index
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %36, align 8
  %index.next = add i64 %index, 4
  %37 = add i64 %indvars.iv45, %index.next
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %41, align 8
  %index.next.1 = add i64 %index, 8
  %42 = add i64 %indvars.iv45, %index.next.1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %46, align 8
  %index.next.2 = add i64 %index, 12
  %47 = add i64 %indvars.iv45, %index.next.2
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %51, align 8
  %index.next.3 = add i64 %index, 16
  %52 = icmp eq i64 %index.next.3, %n.vec
  br i1 %52, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %22, %n.vec
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader

for.body26:                                       ; preds = %for.body26, %for.body26.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body26.lr.ph.new ], [ %indvars.iv.next.1, %for.body26 ]
  %53 = add nuw nsw i64 %indvars.iv, %indvars.iv27
  %54 = trunc i64 %53 to i32
  %rem28 = srem i32 %54, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = add nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %56 = trunc i64 %55 to i32
  %rem28.1 = srem i32 %56, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i1.1 = insertelement <2 x double> undef, double %conv30, i32 0
  %div31.v.i1.2 = insertelement <2 x double> %div31.v.i1.1, double %conv30, i32 1
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, %div31.v.i1.2
  %57 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %57, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv27
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond40.preheader.unr-lcssa, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader, %for.body43
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.body43 ], [ %indvars.iv23.ph, %for.body43.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv23
  store double -9.990000e+02, double* %arrayidx47, align 8
  %exitcond26 = icmp eq i64 %indvars.iv23, %wide.trip.count25
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 1
  br i1 %exitcond26, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.cond40.preheader
  %cmp20 = icmp slt i64 %indvars.iv.next28, %11
  %indvars.iv.next44 = add i64 %indvars.iv43, -1
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  br i1 %cmp20, label %for.body26.lr.ph, label %for.end53.loopexit

for.end53.loopexit:                               ; preds = %for.inc51
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.cond19.preheader, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1200 x double]*, align 8
  %k = alloca i32, align 4
  %temp2 = alloca double, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8
  %cmp15 = icmp sgt i32 %m, 0
  br i1 %cmp15, label %for.cond1.preheader.lr.ph, label %for.end55

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp210 = icmp sgt i32 %n, 0
  %k.promoted = load i32, i32* %k, align 4
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %2 = sext i32 %m to i64
  %mul44 = fmul double %alpha, 0.000000e+00
  %wide.trip.count = zext i32 %0 to i64
  %3 = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %3, 0
  %4 = icmp eq i32 %0, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %for.cond1.preheader.lr.ph
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.inc53 ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv26 = phi i32 [ %indvars.iv.next27, %for.inc53 ], [ -1, %for.cond1.preheader.lr.ph ]
  %inc.lcssa14.lcssa19 = phi i32 [ %inc.lcssa14.lcssa20, %for.inc53 ], [ %k.promoted, %for.cond1.preheader.lr.ph ]
  %5 = phi [1200 x double]* [ %.lcssa5, %for.inc53 ], [ %B, %for.cond1.preheader.lr.ph ]
  %6 = phi [1000 x double]* [ %.lcssa6, %for.inc53 ], [ %A, %for.cond1.preheader.lr.ph ]
  %7 = add nsw i32 %indvars.iv26, 1
  br i1 %cmp210, label %for.body3.lr.ph, label %for.inc53

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %cmp57 = icmp sgt i64 %indvars.iv32, 0
  br i1 %cmp57, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv32
  br i1 %lcmp.mod, label %for.body3.prol.preheader, label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader
  store double 0.000000e+00, double* %temp2, align 8
  %arrayidx31.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 0
  %8 = load double, double* %arrayidx31.prol, align 8
  %mul32.prol = fmul double %8, %beta
  %arrayidx36.prol = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv32, i64 0
  %9 = load double, double* %arrayidx36.prol, align 8
  %mul37.prol = fmul double %9, %alpha
  %10 = load double, double* %arrayidx41, align 8
  %mul42.prol = fmul double %mul37.prol, %10
  %add43.prol = fadd double %mul32.prol, %mul42.prol
  %add45.prol = fadd double %add43.prol, %mul44
  store double %add45.prol, double* %arrayidx31.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.preheader ]
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  br i1 %4, label %for.inc53.loopexit38, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %wide.trip.count28 = zext i32 %indvars.iv26 to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond4.for.end_crit_edge.us, %for.body3.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond4.for.end_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %11 = phi [1200 x double]* [ %18, %for.cond4.for.end_crit_edge.us ], [ %5, %for.body3.us.preheader ]
  %12 = phi [1000 x double]* [ %20, %for.cond4.for.end_crit_edge.us ], [ %6, %for.body3.us.preheader ]
  store double 0.000000e+00, double* %temp2, align 8
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.body3.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.body6.us ], [ 0, %for.body3.us ]
  %13 = phi [1200 x double]* [ %18, %for.body6.us ], [ %11, %for.body3.us ]
  %14 = phi [1000 x double]* [ %20, %for.body6.us ], [ %12, %for.body3.us ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %13, i64 %indvars.iv32, i64 %indvars.iv30
  %15 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %15, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %14, i64 %indvars.iv32, i64 %indvars.iv24
  %16 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %16
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv24, i64 %indvars.iv30
  %17 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %17
  store double %add.us, double* %arrayidx17.us, align 8
  %18 = load [1200 x double]*, [1200 x double]** %B.addr, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv24, i64 %indvars.iv30
  %19 = load double, double* %arrayidx21.us, align 8
  %20 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %arrayidx25.us = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv32, i64 %indvars.iv24
  %21 = load double, double* %arrayidx25.us, align 8
  %mul26.us = fmul double %19, %21
  %22 = load double, double* %temp2, align 8
  %add27.us = fadd double %22, %mul26.us
  store double %add27.us, double* %temp2, align 8
  %exitcond29 = icmp eq i64 %indvars.iv24, %wide.trip.count28
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  br i1 %exitcond29, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv30
  %23 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %23, %beta
  %arrayidx36.us = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv32, i64 %indvars.iv30
  %24 = load double, double* %arrayidx36.us, align 8
  %mul37.us = fmul double %24, %alpha
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv32, i64 %indvars.iv32
  %25 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %mul37.us, %25
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp ne i64 %indvars.iv.next31, %1
  br i1 %exitcond, label %for.body3.us, label %for.inc53.loopexit

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next.1, %for.body3 ]
  store double 0.000000e+00, double* %temp2, align 8
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv
  %26 = bitcast double* %arrayidx31 to <2 x double>*
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv
  %27 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %27, %alpha
  %28 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  store double 0.000000e+00, double* %temp2, align 8
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv.next
  %29 = load <2 x double>, <2 x double>* %26, align 8
  %mul32.v.i1.1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul32.v.i1.2 = insertelement <2 x double> %mul32.v.i1.1, double %beta, i32 1
  %mul32 = fmul <2 x double> %29, %mul32.v.i1.2
  %mul32.v.r1 = extractelement <2 x double> %mul32, i32 0
  %mul32.v.r2 = extractelement <2 x double> %mul32, i32 1
  %add43 = fadd double %mul32.v.r1, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %30, %alpha
  %31 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %31
  %add43.1 = fadd double %mul32.v.r2, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc53.loopexit38.unr-lcssa, label %for.body3

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit38.unr-lcssa:                   ; preds = %for.body3
  br label %for.inc53.loopexit38

for.inc53.loopexit38:                             ; preds = %for.body3.prol.loopexit, %for.inc53.loopexit38.unr-lcssa
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit38, %for.inc53.loopexit, %for.cond1.preheader
  %inc.lcssa14.lcssa20 = phi i32 [ %inc.lcssa14.lcssa19, %for.cond1.preheader ], [ %7, %for.inc53.loopexit ], [ 0, %for.inc53.loopexit38 ]
  %.lcssa6 = phi [1000 x double]* [ %6, %for.cond1.preheader ], [ %20, %for.inc53.loopexit ], [ %6, %for.inc53.loopexit38 ]
  %.lcssa5 = phi [1200 x double]* [ %5, %for.cond1.preheader ], [ %18, %for.inc53.loopexit ], [ %5, %for.inc53.loopexit38 ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %indvars.iv.next27 = add nsw i32 %indvars.iv26, 1
  %exitcond41 = icmp ne i64 %indvars.iv.next33, %2
  br i1 %exitcond41, label %for.cond1.preheader, label %for.cond.for.end55_crit_edge

for.cond.for.end55_crit_edge:                     ; preds = %for.inc53
  store i32 %inc.lcssa14.lcssa20, i32* %k, align 4
  br label %for.end55

for.end55:                                        ; preds = %entry, %for.cond.for.end55_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %m, 0
  %cmp32 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp4, %cmp32
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = sext i32 %m to i64
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
