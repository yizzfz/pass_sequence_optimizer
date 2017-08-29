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
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %11 = add i32 %1, -1
  %12 = sext i32 %0 to i64
  %wide.trip.count38 = zext i32 %11 to i64
  %13 = and i64 %wide.trip.count38, 1
  %lcmp.mod54 = icmp eq i64 %13, 0
  %14 = icmp eq i32 %11, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge26.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge26.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge26.us ], [ -1, %.preheader.us.preheader ]
  %15 = add i64 %indvars.iv40, 4294967295
  %16 = and i64 %15, 4294967295
  %17 = icmp sgt i64 %indvars.iv40, 0
  br i1 %17, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %18 = and i64 %15, 1
  %lcmp.mod = icmp eq i64 %18, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.preheader, label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader
  %19 = trunc i64 %indvars.iv40 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %9
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 0
  store double %22, double* %23, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  %24 = icmp eq i64 %16, 0
  br i1 %24, label %._crit_edge.us.loopexit, label %.lr.ph.us.preheader.new

.lr.ph.us.preheader.new:                          ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph.us
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv40
  store double 1.000000e+00, double* %25, align 8
  %26 = trunc i64 %indvars.iv40 to i32
  %27 = add i32 %26, %1
  br i1 %lcmp.mod54, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %._crit_edge.us
  br label %28

; <label>:28:                                     ; preds = %.prol.preheader
  %29 = srem i32 %27, %1
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 0
  store double %31, double* %32, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %._crit_edge.us, %28
  %indvars.iv36.unr.ph = phi i64 [ 1, %28 ], [ 0, %._crit_edge.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %14, label %._crit_edge26.us, label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %.prol.loopexit
  br label %33

; <label>:33:                                     ; preds = %33, %._crit_edge.us.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr.ph, %._crit_edge.us.new ], [ %indvars.iv.next37.1, %33 ]
  %34 = trunc i64 %indvars.iv36 to i32
  %35 = sub i32 %27, %34
  %36 = srem i32 %35, %1
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, %8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv36
  store double %38, double* %39, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %40 = trunc i64 %indvars.iv.next37 to i32
  %41 = sub i32 %27, %40
  %42 = srem i32 %41, %1
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next37
  store double %44, double* %45, align 8
  %exitcond39.1 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  br i1 %exitcond39.1, label %._crit_edge26.us.unr-lcssa, label %33

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.preheader.new ], [ %indvars.iv.next.1, %.lr.ph.us ]
  %46 = add nuw nsw i64 %indvars.iv, %indvars.iv40
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %9
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  store double %50, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = add nuw nsw i64 %indvars.iv.next, %indvars.iv40
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %56, double* %57, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph.us

._crit_edge26.us.unr-lcssa:                       ; preds = %33
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %.prol.loopexit, %._crit_edge26.us.unr-lcssa
  %indvars.iv.next41 = add nuw i64 %indvars.iv40, 1
  %58 = icmp slt i64 %indvars.iv.next41, %12
  %indvars.iv.next35 = add nsw i32 %indvars.iv34, 1
  br i1 %58, label %.preheader.us, label %._crit_edge29.loopexit

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv44 = phi i32 [ %indvars.iv.next45, %._crit_edge ], [ -1, %.preheader.preheader ]
  %59 = add i64 %indvars.iv48, 4294967295
  %60 = and i64 %59, 4294967295
  %61 = icmp sgt i64 %indvars.iv48, 0
  br i1 %61, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %wide.trip.count46 = zext i32 %indvars.iv44 to i64
  %62 = and i64 %59, 1
  %lcmp.mod56 = icmp eq i64 %62, 0
  br i1 %lcmp.mod56, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %63 = trunc i64 %indvars.iv48 to i32
  %64 = srem i32 %63, %0
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %65, %9
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv48, i64 0
  store double %66, double* %67, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv42.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %60, 0
  br i1 %68, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next43.1, %.lr.ph ]
  %69 = add nuw nsw i64 %indvars.iv42, %indvars.iv48
  %70 = trunc i64 %69 to i32
  %71 = srem i32 %70, %0
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %72, %9
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv42
  store double %73, double* %74, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %75 = add nuw nsw i64 %indvars.iv.next43, %indvars.iv48
  %76 = trunc i64 %75 to i32
  %77 = srem i32 %76, %0
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %78, %9
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv.next43
  store double %79, double* %80, align 8
  %exitcond47.1 = icmp eq i64 %indvars.iv.next43, %wide.trip.count46
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  br i1 %exitcond47.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %81, align 8
  %indvars.iv.next49 = add nuw i64 %indvars.iv48, 1
  %82 = icmp slt i64 %indvars.iv.next49, %10
  %indvars.iv.next45 = add nsw i32 %indvars.iv44, 1
  br i1 %82, label %.preheader, label %._crit_edge29.loopexit52

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29.loopexit52:                         ; preds = %._crit_edge
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit52, %._crit_edge29.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader24.us.preheader, label %._crit_edge30

.preheader24.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, -1
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %wide.trip.count45 = sext i32 %9 to i64
  %wide.trip.count = zext i32 %8 to i64
  %12 = add nuw nsw i64 %wide.trip.count, 1
  %13 = and i64 %12, 8589934588
  %14 = add nsw i64 %13, -4
  %15 = lshr exact i64 %14, 2
  %16 = add nsw i64 %wide.trip.count45, -1
  %min.iters.check = icmp ult i64 %12, 4
  %n.vec = and i64 %12, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert57 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat58 = shufflevector <2 x double> %broadcast.splatinsert57, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = and i64 %15, 1
  %lcmp.mod = icmp eq i64 %17, 0
  %18 = icmp eq i64 %15, 0
  %cmp.n = icmp eq i64 %12, %n.vec
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %._crit_edge28.us, %.preheader24.us.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge28.us ], [ 0, %.preheader24.us.preheader ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge28.us ], [ 1, %.preheader24.us.preheader ]
  %19 = sub i64 %wide.trip.count45, %indvars.iv49
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %20 = icmp slt i64 %indvars.iv.next50, %11
  br i1 %20, label %.preheader.us.us.preheader, label %.preheader.us31.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader24.us
  %xtraiter61 = and i64 %19, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter61, 0
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv49
  %indvars.iv.next44.prol = add nuw i64 %indvars.iv41, 1
  %22 = icmp eq i64 %16, %indvars.iv49
  br label %.preheader.us.us

.preheader.us31.preheader:                        ; preds = %.preheader24.us
  br i1 %min.iters.check, label %.preheader.us31.preheader59, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us31.preheader
  br i1 %cmp.zero, label %.preheader.us31.preheader59, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 0
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %24, align 8
  %25 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load56.prol = load <2 x double>, <2 x double>* %26, align 8
  %27 = fmul <2 x double> %wide.load.prol, %broadcast.splat58
  %28 = fmul <2 x double> %wide.load56.prol, %broadcast.splat58
  %29 = bitcast double* %23 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8
  %30 = bitcast double* %25 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %18, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %index
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %34, align 8
  %35 = fmul <2 x double> %wide.load, %broadcast.splat58
  %36 = fmul <2 x double> %wide.load56, %broadcast.splat58
  %37 = bitcast double* %31 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8
  %38 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8
  %index.next = add i64 %index, 4
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %index.next
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load56.1 = load <2 x double>, <2 x double>* %42, align 8
  %43 = fmul <2 x double> %wide.load.1, %broadcast.splat58
  %44 = fmul <2 x double> %wide.load56.1, %broadcast.splat58
  %45 = bitcast double* %39 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8
  %46 = bitcast double* %41 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8
  %index.next.1 = add i64 %index, 8
  %47 = icmp eq i64 %index.next.1, %n.vec
  br i1 %47, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !1

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge28.us, label %.preheader.us31.preheader59

.preheader.us31.preheader59:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us31.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader.us31.preheader ], [ %n.vec, %middle.block ]
  br label %.preheader.us31

.preheader.us31:                                  ; preds = %.preheader.us31.preheader59, %.preheader.us31
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader.us31 ], [ %indvars.iv.ph, %.preheader.us31.preheader59 ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %2
  store double %50, double* %48, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge28.us.loopexit60, label %.preheader.us31, !llvm.loop !4

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge28.us

._crit_edge28.us.loopexit60:                      ; preds = %.preheader.us31
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit60, %._crit_edge28.us.loopexit, %middle.block
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  br i1 %20, label %.preheader24.us, label %._crit_edge30.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv47
  %.pre = load double, double* %51, align 8
  br i1 %lcmp.mod62, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  br label %52

; <label>:52:                                     ; preds = %.prol.preheader
  %53 = load double, double* %21, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv47
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %.pre, %56
  store double %57, double* %51, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us.us, %52
  %.lcssa.unr.ph = phi double [ %57, %52 ], [ undef, %.preheader.us.us ]
  %.unr.ph = phi double [ %57, %52 ], [ %.pre, %.preheader.us.us ]
  %indvars.iv43.unr.ph = phi i64 [ %indvars.iv.next44.prol, %52 ], [ %indvars.iv41, %.preheader.us.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %22, label %._crit_edge.us.us, label %.preheader.us.us.new

.preheader.us.us.new:                             ; preds = %.prol.loopexit
  br label %59

._crit_edge.us.us.unr-lcssa:                      ; preds = %59
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %72, %._crit_edge.us.us.unr-lcssa ]
  %58 = fmul double %.lcssa, %2
  store double %58, double* %51, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next48, %10
  br i1 %exitcond54, label %._crit_edge28.us.loopexit, label %.preheader.us.us

; <label>:59:                                     ; preds = %59, %.preheader.us.us.new
  %60 = phi double [ %.unr.ph, %.preheader.us.us.new ], [ %72, %59 ]
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.preheader.us.us.new ], [ %indvars.iv.next44.1, %59 ]
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv49
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv47
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %51, align 8
  %indvars.iv.next44 = add nuw i64 %indvars.iv43, 1
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next44, i64 %indvars.iv49
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next44, i64 %indvars.iv47
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %51, align 8
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  %indvars.iv.next44.1 = add i64 %indvars.iv43, 2
  br i1 %exitcond46.1, label %._crit_edge.us.us.unr-lcssa, label %59

._crit_edge30.loopexit:                           ; preds = %._crit_edge28.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %12 = mul nsw i64 %indvars.iv15, %11
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %13 = add nsw i64 %indvars.iv, %12
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge14, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %10
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, %11
  br i1 %exitcond17, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
