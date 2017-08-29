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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count54 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %12 = and i32 %1, 1
  %lcmp.mod59 = icmp eq i32 %12, 0
  %13 = icmp eq i32 %1, 1
  %wide.trip.count45 = zext i32 %0 to i64
  %wide.trip.count41.1 = zext i32 %1 to i64
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %8, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us, %.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge32.us ]
  %18 = add nuw i64 %indvars.iv43, 4294967295
  %19 = trunc i64 %18 to i32
  %20 = icmp sgt i64 %indvars.iv43, 0
  br i1 %20, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %21, align 8
  %22 = trunc i64 %indvars.iv43 to i32
  %23 = add i32 %22, %1
  br i1 %lcmp.mod59, label %.prol.loopexit57, label %.prol.preheader56

.prol.preheader56:                                ; preds = %._crit_edge.us
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 0
  store double %26, double* %27, align 8
  br label %.prol.loopexit57

.prol.loopexit57:                                 ; preds = %._crit_edge.us, %.prol.preheader56
  %indvars.iv39.unr.ph = phi i64 [ 1, %.prol.preheader56 ], [ 0, %._crit_edge.us ]
  br i1 %13, label %._crit_edge32.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit57
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %._crit_edge.us.new ], [ %indvars.iv39.unr.ph, %._crit_edge.us.new.preheader ]
  %28 = trunc i64 %indvars.iv39 to i32
  %29 = sub i32 %23, %28
  %30 = srem i32 %29, %1
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv39
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %33 = trunc i64 %indvars.iv.next40 to i32
  %34 = sub i32 %23, %33
  %35 = srem i32 %34, %1
  %36 = sitofp i32 %35 to double
  %37 = insertelement <2 x double> undef, double %31, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  %39 = fdiv <2 x double> %38, %17
  %40 = bitcast double* %32 to <2 x double>*
  store <2 x double> %39, <2 x double>* %40, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next40.1, %wide.trip.count41.1
  br i1 %exitcond42.1, label %._crit_edge32.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %41 = add nuw nsw i64 %indvars.iv, %indvars.iv43
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %0
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = add nuw nsw i64 %indvars.iv.next, %indvars.iv43
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %44, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fdiv <2 x double> %51, %15
  %53 = bitcast double* %45 to <2 x double>*
  store <2 x double> %52, <2 x double>* %53, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv43
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter65 = and i64 %indvars.iv43, 1
  %lcmp.mod = icmp eq i64 %xtraiter65, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %54 = trunc i64 %indvars.iv43 to i32
  %55 = srem i32 %54, %0
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %9
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 0
  store double %57, double* %58, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %59 = icmp eq i32 %19, 0
  br i1 %59, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.prol.loopexit57
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge35.loopexit, label %.preheader.us

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next53, %._crit_edge ]
  %60 = add nuw i64 %indvars.iv52, 4294967295
  %61 = trunc i64 %60 to i32
  %62 = icmp sgt i64 %indvars.iv52, 0
  br i1 %62, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter6264 = and i64 %indvars.iv52, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter6264, 0
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph
  %63 = trunc i64 %indvars.iv52 to i32
  %64 = srem i32 %63, %0
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %65, %9
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 0
  store double %66, double* %67, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph, %.prol.preheader60
  %indvars.iv47.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph ]
  %68 = icmp eq i32 %61, 0
  br i1 %68, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit61
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.lr.ph.new ], [ %indvars.iv47.unr.ph, %.lr.ph.new.preheader ]
  %69 = add nuw nsw i64 %indvars.iv47, %indvars.iv52
  %70 = trunc i64 %69 to i32
  %71 = srem i32 %70, %0
  %72 = sitofp i32 %71 to double
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv47
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %74 = add nuw nsw i64 %indvars.iv.next48, %indvars.iv52
  %75 = trunc i64 %74 to i32
  %76 = srem i32 %75, %0
  %77 = sitofp i32 %76 to double
  %78 = insertelement <2 x double> undef, double %72, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fdiv <2 x double> %79, %11
  %81 = bitcast double* %73 to <2 x double>*
  store <2 x double> %80, <2 x double>* %81, align 8
  %indvars.iv.next48.1 = add nuw nsw i64 %indvars.iv47, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %indvars.iv52
  br i1 %exitcond51.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit61, %.preheader
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv52
  store double 1.000000e+00, double* %82, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge35.loopexit68, label %.preheader

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35.loopexit68:                         ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit68, %._crit_edge35.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = sext i32 %0 to i64
  %9 = add i32 %1, -1
  %10 = zext i32 %0 to i64
  %11 = add nuw nsw i64 %10, 1
  %12 = add nsw i64 %10, -2
  %wide.trip.count50 = zext i32 %1 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp ult i32 %9, 3
  %14 = add nsw i32 %xtraiter, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count50, -4
  %18 = insertelement <2 x double> undef, double %2, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %2, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next53, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv42 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next43, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %22 = icmp slt i64 %indvars.iv.next53, %8
  br i1 %22, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %23 = sub i64 %11, %indvars.iv52
  %xtraiter57 = and i64 %23, 1
  %lcmp.mod58 = icmp eq i64 %xtraiter57, 0
  %24 = icmp eq i64 %12, %indvars.iv52
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv52
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod, label %.preheader.us32.prol.loopexit, label %.preheader.us32.prol.preheader

.preheader.us32.prol.preheader:                   ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.prol:                             ; preds = %.preheader.us32.prol.preheader, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.prol.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.prol
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %2
  store double %28, double* %26, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol.loopexit.loopexit, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit.loopexit:           ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol.loopexit.loopexit, %.preheader.us32.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader ], [ %16, %.preheader.us32.prol.loopexit.loopexit ]
  br i1 %13, label %..loopexit_crit_edge.us, label %.preheader.us32.preheader62

.preheader.us32.preheader62:                      ; preds = %.preheader.us32.prol.loopexit
  %29 = sub nsw i64 %17, %indvars.iv.unr
  %30 = lshr i64 %29, 2
  %31 = add nuw nsw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 2
  br i1 %min.iters.check, label %.preheader.us32.preheader70, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us32.preheader62
  %n.mod.vf = and i64 %31, 1
  %n.vec = sub nsw i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %32 = add nsw i64 %indvars.iv.unr, 4
  %33 = shl nuw i64 %30, 2
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %34, %35
  br i1 %cmp.zero, label %.preheader.us32.preheader70, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %36 = shl i64 %index, 2
  %37 = add i64 %indvars.iv.unr, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %37
  %39 = bitcast double* %38 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %39, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %40 = fmul <2 x double> %strided.vec, %broadcast.splat69
  %41 = fmul <2 x double> %strided.vec65, %broadcast.splat69
  %42 = fmul <2 x double> %strided.vec66, %broadcast.splat69
  %43 = add nsw i64 %37, 3
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %43
  %45 = fmul <2 x double> %strided.vec67, %broadcast.splat69
  %46 = getelementptr double, double* %44, i64 -3
  %47 = bitcast double* %46 to <8 x double>*
  %48 = shufflevector <2 x double> %40, <2 x double> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %49 = shufflevector <2 x double> %42, <2 x double> %45, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %48, <4 x double> %49, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %47, align 8
  %index.next = add i64 %index, 2
  %50 = icmp eq i64 %index.next, %n.vec
  br i1 %50, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %..loopexit_crit_edge.us, label %.preheader.us32.preheader70

.preheader.us32.preheader70:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us32.preheader62
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.preheader.us32.preheader62 ]
  br label %.preheader.us32

.preheader.us32:                                  ; preds = %.preheader.us32.preheader70, %.preheader.us32
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us32 ], [ %indvars.iv.ph, %.preheader.us32.preheader70 ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %52 = bitcast double* %51 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = fmul <2 x double> %53, %19
  %55 = bitcast double* %51 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = fmul <2 x double> %58, %21
  %60 = bitcast double* %56 to <2 x double>*
  store <2 x double> %59, <2 x double>* %60, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count50
  br i1 %exitcond.3, label %..loopexit_crit_edge.us.loopexit71, label %.preheader.us32, !llvm.loop !6

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit71:               ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit71, %..loopexit_crit_edge.us.loopexit, %middle.block, %.preheader.us32.prol.loopexit
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %10
  br i1 %exitcond55, label %._crit_edge31.loopexit, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv48
  br i1 %lcmp.mod58, label %.preheader.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  %.pre61.pre = load double, double* %61, align 8
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %62 = load double, double* %25, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv48
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = load double, double* %61, align 8
  %67 = fadd double %66, %65
  store double %67, double* %61, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %.pre61 = phi double [ %67, %.prol.preheader ], [ %.pre61.pre, %.preheader.us.us..prol.loopexit_crit_edge ]
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us..prol.loopexit_crit_edge ]
  br i1 %24, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %68 = phi double [ %.pre61, %.prol.loopexit ], [ %82, %._crit_edge.us.us.loopexit ]
  %69 = fmul double %68, %2
  store double %69, double* %61, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %70 = phi double [ %82, %.preheader.us.us.new ], [ %.pre61, %.preheader.us.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.us.us.new ], [ %indvars.iv44.unr.ph, %.preheader.us.us.new.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv52
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv48
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %70, %75
  store double %76, double* %61, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv52
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv48
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %61, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next45.1, %10
  br i1 %exitcond47.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge31.loopexit:                           ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
