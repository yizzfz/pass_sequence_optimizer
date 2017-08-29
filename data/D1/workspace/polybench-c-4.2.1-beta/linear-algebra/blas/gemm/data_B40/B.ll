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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader9.lr.ph, label %.preheader8.thread

.preheader8.thread:                               ; preds = %8
  br label %.preheader6

.preheader9.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader9.us.preheader, label %.preheader9.lr.ph..preheader8_crit_edge

.preheader9.lr.ph..preheader8_crit_edge:          ; preds = %.preheader9.lr.ph
  br label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %12 = sext i32 %0 to i64
  %wide.trip.count55 = zext i32 %1 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge27.us..preheader9.us_crit_edge, %.preheader9.us.preheader
  %indvars.iv57 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next58, %._crit_edge27.us..preheader9.us_crit_edge ]
  br label %13

; <label>:13:                                     ; preds = %._crit_edge, %.preheader9.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge ], [ 0, %.preheader9.us ]
  %14 = mul nsw i64 %indvars.iv53, %indvars.iv57
  %15 = add nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %11
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv53
  store double %19, double* %20, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge27.us, label %._crit_edge

._crit_edge:                                      ; preds = %13
  br label %13

._crit_edge27.us:                                 ; preds = %13
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  %21 = icmp slt i64 %indvars.iv.next58, %12
  br i1 %21, label %._crit_edge27.us..preheader9.us_crit_edge, label %.preheader8.loopexit

._crit_edge27.us..preheader9.us_crit_edge:        ; preds = %._crit_edge27.us
  br label %.preheader9.us

.preheader8.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader9.lr.ph..preheader8_crit_edge, %.preheader8.loopexit
  br i1 true, label %.preheader7.lr.ph, label %.preheader8..preheader6_crit_edge

.preheader8..preheader6_crit_edge:                ; preds = %.preheader8
  br label %.preheader6

.preheader7.lr.ph:                                ; preds = %.preheader8
  %22 = icmp sgt i32 %2, 0
  %23 = sitofp i32 %2 to double
  br i1 %22, label %.preheader7.us.preheader, label %..preheader6_crit_edge.loopexit36

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %24 = sext i32 %0 to i64
  %25 = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %25, 0
  %26 = icmp eq i32 %2, 1
  %wide.trip.count47.1 = zext i32 %2 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge18.us..preheader7.us_crit_edge, %.preheader7.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next50, %._crit_edge18.us..preheader7.us_crit_edge ]
  br i1 %lcmp.mod, label %.preheader7.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader7.us..prol.loopexit_crit_edge:          ; preds = %.preheader7.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader7.us
  %27 = trunc i64 %indvars.iv49 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %23
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader7.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv45.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader7.us..prol.loopexit_crit_edge ]
  br i1 %26, label %.prol.loopexit.._crit_edge18.us_crit_edge, label %.preheader7.us.new.preheader

.prol.loopexit.._crit_edge18.us_crit_edge:        ; preds = %.prol.loopexit
  br label %._crit_edge18.us

.preheader7.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader7.us.new

.preheader7.us.new:                               ; preds = %.preheader7.us.new..preheader7.us.new_crit_edge, %.preheader7.us.new.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.preheader7.us.new..preheader7.us.new_crit_edge ], [ %indvars.iv45.unr.ph, %.preheader7.us.new.preheader ]
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %32 = mul nsw i64 %indvars.iv.next46, %indvars.iv49
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %2
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %23
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv45
  store double %36, double* %37, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %38 = mul nsw i64 %indvars.iv.next46.1, %indvars.iv49
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %2
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %23
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv.next46
  store double %42, double* %43, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next46.1, %wide.trip.count47.1
  br i1 %exitcond48.1, label %._crit_edge18.us.loopexit, label %.preheader7.us.new..preheader7.us.new_crit_edge

.preheader7.us.new..preheader7.us.new_crit_edge:  ; preds = %.preheader7.us.new
  br label %.preheader7.us.new

._crit_edge18.us.loopexit:                        ; preds = %.preheader7.us.new
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %.prol.loopexit.._crit_edge18.us_crit_edge, %._crit_edge18.us.loopexit
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %44 = icmp slt i64 %indvars.iv.next50, %24
  br i1 %44, label %._crit_edge18.us..preheader7.us_crit_edge, label %..preheader6_crit_edge.loopexit

._crit_edge18.us..preheader7.us_crit_edge:        ; preds = %._crit_edge18.us
  br label %.preheader7.us

..preheader6_crit_edge.loopexit:                  ; preds = %._crit_edge18.us
  br label %..preheader6_crit_edge

..preheader6_crit_edge.loopexit36:                ; preds = %.preheader7.lr.ph
  br label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %..preheader6_crit_edge.loopexit36, %..preheader6_crit_edge.loopexit
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader8..preheader6_crit_edge, %.preheader8.thread, %..preheader6_crit_edge
  %45 = icmp sgt i32 %2, 0
  br i1 %45, label %.preheader.lr.ph, label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6
  br label %58

.preheader.lr.ph:                                 ; preds = %.preheader6
  %46 = icmp sgt i32 %1, 0
  %47 = sitofp i32 %1 to double
  br i1 %46, label %.preheader.us.preheader, label %._crit_edge13.loopexit35

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %48 = sext i32 %2 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge.us..preheader.us_crit_edge ]
  br label %49

; <label>:49:                                     ; preds = %._crit_edge61, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge61 ], [ 0, %.preheader.us ]
  %50 = add nuw nsw i64 %indvars.iv, 2
  %51 = mul nsw i64 %50, %indvars.iv43
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, %1
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %47
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv
  store double %55, double* %56, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge61

._crit_edge61:                                    ; preds = %49
  br label %49

._crit_edge.us:                                   ; preds = %49
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %57 = icmp slt i64 %indvars.iv.next44, %48
  br i1 %57, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge13.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13.loopexit35:                         ; preds = %.preheader.lr.ph
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit35, %._crit_edge13.loopexit
  br label %58

; <label>:58:                                     ; preds = %.preheader6._crit_edge, %._crit_edge13
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader5.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %72

.preheader5.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %12 = sext i32 %1 to i64
  br i1 %10, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %13 = sext i32 %0 to i64
  %xtraiter144 = and i64 %13, 1
  %lcmp.mod145 = icmp eq i64 %xtraiter144, 0
  br i1 %lcmp.mod145, label %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, label %.preheader5.prol.preheader

.preheader5.preheader..preheader5.prol.loopexit_crit_edge: ; preds = %.preheader5.preheader
  br label %.preheader5.prol.loopexit

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br i1 false, label %.preheader5..preheader.us_crit_edge.prol, label %.preheader5.prol.._crit_edge9.prol_crit_edge

.preheader5.prol.._crit_edge9.prol_crit_edge:     ; preds = %.preheader5.prol.preheader
  br label %._crit_edge9.prol

.preheader5..preheader.us_crit_edge.prol:         ; preds = %.preheader5.prol.preheader
  br i1 undef, label %.preheader.us.prol.scalar.ph.preheader.prol_crit_edge, label %min.iters.checked.prol

.preheader.us.prol.scalar.ph.preheader.prol_crit_edge: ; preds = %.preheader5..preheader.us_crit_edge.prol
  br label %scalar.ph.preheader.prol

min.iters.checked.prol:                           ; preds = %.preheader5..preheader.us_crit_edge.prol
  br i1 undef, label %min.iters.checked.prol.scalar.ph.preheader.prol_crit_edge, label %vector.memcheck.prol

min.iters.checked.prol.scalar.ph.preheader.prol_crit_edge: ; preds = %min.iters.checked.prol
  br label %scalar.ph.preheader.prol

vector.memcheck.prol:                             ; preds = %min.iters.checked.prol
  br i1 undef, label %vector.memcheck.prol.scalar.ph.preheader.prol_crit_edge, label %vector.ph.prol

vector.memcheck.prol.scalar.ph.preheader.prol_crit_edge: ; preds = %vector.memcheck.prol
  br label %scalar.ph.preheader.prol

vector.ph.prol:                                   ; preds = %vector.memcheck.prol
  br i1 undef, label %vector.body.prol.._crit_edge.us.prol_crit_edge, label %vector.body.prol.scalar.ph.preheader.prol_crit_edge

vector.body.prol.scalar.ph.preheader.prol_crit_edge: ; preds = %vector.ph.prol
  br label %scalar.ph.preheader.prol

vector.body.prol.._crit_edge.us.prol_crit_edge:   ; preds = %vector.ph.prol
  br label %._crit_edge.us.prol

scalar.ph.preheader.prol:                         ; preds = %vector.body.prol.scalar.ph.preheader.prol_crit_edge, %vector.memcheck.prol.scalar.ph.preheader.prol_crit_edge, %min.iters.checked.prol.scalar.ph.preheader.prol_crit_edge, %.preheader.us.prol.scalar.ph.preheader.prol_crit_edge
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %vector.body.prol.._crit_edge.us.prol_crit_edge, %scalar.ph.preheader.prol
  br label %._crit_edge9.prol

._crit_edge9.prol:                                ; preds = %.preheader5.prol.._crit_edge9.prol_crit_edge, %._crit_edge.us.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, %._crit_edge9.prol
  %indvars.iv48.unr = phi i64 [ 0, %.preheader5.preheader..preheader5.prol.loopexit_crit_edge ], [ 1, %._crit_edge9.prol ]
  %14 = icmp eq i32 %0, 1
  br i1 %14, label %.preheader5.prol.loopexit.._crit_edge14.loopexit143_crit_edge, label %.preheader5.preheader.new

.preheader5.prol.loopexit.._crit_edge14.loopexit143_crit_edge: ; preds = %.preheader5.prol.loopexit
  br label %._crit_edge14.loopexit143

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %15 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %2 to i64
  %16 = icmp sgt i64 %12, 1
  %smax77 = select i1 %16, i64 %12, i64 1
  %17 = and i64 %smax77, 9223372036854775804
  %18 = add nsw i64 %17, -4
  %19 = lshr exact i64 %18, 2
  %min.iters.check125 = icmp ult i64 %smax77, 4
  %cmp.zero82 = icmp eq i64 %17, 0
  %broadcast.splatinsert115 = insertelement <2 x double> undef, double %3, i32 0
  %cmp.n110 = icmp eq i64 %smax77, %17
  %broadcast.splatinsert141 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat142 = shufflevector <2 x double> %broadcast.splatinsert141, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = and i64 %19, 1
  %lcmp.mod = icmp eq i64 %20, 0
  %21 = icmp eq i64 %19, 0
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvar84 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvar.next85, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv39 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next40, %._crit_edge9.us..preheader5.us_crit_edge ]
  %scevgep86 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar84, i64 0
  %scevgep89 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar84, i64 %smax77
  br i1 %min.iters.check125, label %.preheader5.us.scalar.ph123.preheader_crit_edge, label %min.iters.checked126

.preheader5.us.scalar.ph123.preheader_crit_edge:  ; preds = %.preheader5.us
  br label %scalar.ph123.preheader

min.iters.checked126:                             ; preds = %.preheader5.us
  br i1 %cmp.zero82, label %min.iters.checked126.scalar.ph123.preheader_crit_edge, label %vector.ph130

min.iters.checked126.scalar.ph123.preheader_crit_edge: ; preds = %min.iters.checked126
  br label %scalar.ph123.preheader

vector.ph130:                                     ; preds = %min.iters.checked126
  br i1 %lcmp.mod, label %vector.body121.prol.preheader, label %vector.ph130.vector.body121.prol.loopexit.unr-lcssa_crit_edge

vector.ph130.vector.body121.prol.loopexit.unr-lcssa_crit_edge: ; preds = %vector.ph130
  br label %vector.body121.prol.loopexit.unr-lcssa

vector.body121.prol.preheader:                    ; preds = %vector.ph130
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 0
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load139.prol = load <2 x double>, <2 x double>* %23, align 8
  %24 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load140.prol = load <2 x double>, <2 x double>* %25, align 8
  %26 = fmul <2 x double> %broadcast.splat142, %wide.load139.prol
  %27 = fmul <2 x double> %broadcast.splat142, %wide.load140.prol
  store <2 x double> %26, <2 x double>* %23, align 8
  store <2 x double> %27, <2 x double>* %25, align 8
  br label %vector.body121.prol.loopexit.unr-lcssa

vector.body121.prol.loopexit.unr-lcssa:           ; preds = %vector.ph130.vector.body121.prol.loopexit.unr-lcssa_crit_edge, %vector.body121.prol.preheader
  %index131.unr.ph = phi i64 [ 4, %vector.body121.prol.preheader ], [ 0, %vector.ph130.vector.body121.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %21, label %vector.body121.prol.loopexit.middle.block122_crit_edge, label %vector.ph130.new

vector.body121.prol.loopexit.middle.block122_crit_edge: ; preds = %vector.body121.prol.loopexit.unr-lcssa
  br label %middle.block122

vector.ph130.new:                                 ; preds = %vector.body121.prol.loopexit.unr-lcssa
  br label %vector.body121

vector.body121:                                   ; preds = %vector.body121.vector.body121_crit_edge, %vector.ph130.new
  %index131 = phi i64 [ %index131.unr.ph, %vector.ph130.new ], [ %index.next132.1, %vector.body121.vector.body121_crit_edge ]
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %index131
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %31, align 8
  %32 = fmul <2 x double> %broadcast.splat142, %wide.load139
  %33 = fmul <2 x double> %broadcast.splat142, %wide.load140
  store <2 x double> %32, <2 x double>* %29, align 8
  store <2 x double> %33, <2 x double>* %31, align 8
  %index.next132 = add i64 %index131, 4
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %index.next132
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load139.1 = load <2 x double>, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load140.1 = load <2 x double>, <2 x double>* %37, align 8
  %38 = fmul <2 x double> %broadcast.splat142, %wide.load139.1
  %39 = fmul <2 x double> %broadcast.splat142, %wide.load140.1
  store <2 x double> %38, <2 x double>* %35, align 8
  store <2 x double> %39, <2 x double>* %37, align 8
  %index.next132.1 = add i64 %index131, 8
  %40 = icmp eq i64 %index.next132.1, %17
  br i1 %40, label %middle.block122.unr-lcssa, label %vector.body121.vector.body121_crit_edge, !llvm.loop !1

vector.body121.vector.body121_crit_edge:          ; preds = %vector.body121
  br label %vector.body121

middle.block122.unr-lcssa:                        ; preds = %vector.body121
  br label %middle.block122

middle.block122:                                  ; preds = %vector.body121.prol.loopexit.middle.block122_crit_edge, %middle.block122.unr-lcssa
  br i1 %cmp.n110, label %middle.block122..preheader4.us_crit_edge, label %middle.block122.scalar.ph123.preheader_crit_edge

middle.block122.scalar.ph123.preheader_crit_edge: ; preds = %middle.block122
  br label %scalar.ph123.preheader

middle.block122..preheader4.us_crit_edge:         ; preds = %middle.block122
  br label %.preheader4.us

scalar.ph123.preheader:                           ; preds = %middle.block122.scalar.ph123.preheader_crit_edge, %min.iters.checked126.scalar.ph123.preheader_crit_edge, %.preheader5.us.scalar.ph123.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked126.scalar.ph123.preheader_crit_edge ], [ 0, %.preheader5.us.scalar.ph123.preheader_crit_edge ], [ %17, %middle.block122.scalar.ph123.preheader_crit_edge ]
  br label %scalar.ph123

scalar.ph123:                                     ; preds = %scalar.ph123.scalar.ph123_crit_edge, %scalar.ph123.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph123.scalar.ph123_crit_edge ], [ %indvars.iv.ph, %scalar.ph123.preheader ]
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %4
  store double %43, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = icmp slt i64 %indvars.iv.next, %12
  br i1 %44, label %scalar.ph123.scalar.ph123_crit_edge, label %.preheader4.us.loopexit, !llvm.loop !4

scalar.ph123.scalar.ph123_crit_edge:              ; preds = %scalar.ph123
  br label %scalar.ph123

.preheader4.us.loopexit:                          ; preds = %scalar.ph123
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %middle.block122..preheader4.us_crit_edge, %.preheader4.us.loopexit
  br i1 %11, label %.preheader.us.us.preheader, label %.preheader4.us.._crit_edge9.us_crit_edge

.preheader4.us.._crit_edge9.us_crit_edge:         ; preds = %.preheader4.us
  br label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %.preheader4.us
  br label %.preheader.us.us

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.preheader4.us.._crit_edge9.us_crit_edge, %._crit_edge9.us.loopexit
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, 1
  %45 = icmp slt i64 %indvars.iv.next40, %15
  %indvar.next85 = add i64 %indvar84, 1
  br i1 %45, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  br label %.preheader5.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %scevgep91 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 0
  %scevgep93 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 %smax77
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv36
  br i1 %min.iters.check125, label %.preheader.us.us.scalar.ph76.preheader_crit_edge, label %min.iters.checked79

.preheader.us.us.scalar.ph76.preheader_crit_edge: ; preds = %.preheader.us.us
  br label %scalar.ph76.preheader

scalar.ph76.preheader:                            ; preds = %middle.block75.scalar.ph76.preheader_crit_edge, %vector.memcheck105.scalar.ph76.preheader_crit_edge, %min.iters.checked79.scalar.ph76.preheader_crit_edge, %.preheader.us.us.scalar.ph76.preheader_crit_edge
  %indvars.iv34.ph = phi i64 [ 0, %vector.memcheck105.scalar.ph76.preheader_crit_edge ], [ 0, %min.iters.checked79.scalar.ph76.preheader_crit_edge ], [ 0, %.preheader.us.us.scalar.ph76.preheader_crit_edge ], [ %17, %middle.block75.scalar.ph76.preheader_crit_edge ]
  br label %scalar.ph76

min.iters.checked79:                              ; preds = %.preheader.us.us
  br i1 %cmp.zero82, label %min.iters.checked79.scalar.ph76.preheader_crit_edge, label %vector.memcheck105

min.iters.checked79.scalar.ph76.preheader_crit_edge: ; preds = %min.iters.checked79
  br label %scalar.ph76.preheader

vector.memcheck105:                               ; preds = %min.iters.checked79
  %bound097 = icmp ult double* %scevgep86, %46
  %bound198 = icmp ult double* %46, %scevgep89
  %found.conflict99 = and i1 %bound097, %bound198
  %bound0100 = icmp ult double* %scevgep86, %scevgep93
  %bound1101 = icmp ult double* %scevgep91, %scevgep89
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %found.conflict99, %found.conflict102
  br i1 %conflict.rdx103, label %vector.memcheck105.scalar.ph76.preheader_crit_edge, label %vector.ph106

vector.memcheck105.scalar.ph76.preheader_crit_edge: ; preds = %vector.memcheck105
  br label %scalar.ph76.preheader

vector.ph106:                                     ; preds = %vector.memcheck105
  %.pre = load double, double* %46, align 8, !alias.scope !6
  %47 = insertelement <2 x double> undef, double %.pre, i32 0
  %48 = fmul <2 x double> %broadcast.splatinsert115, %47
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74.vector.body74_crit_edge, %vector.ph106
  %index107 = phi i64 [ 0, %vector.ph106 ], [ %index.next108, %vector.body74.vector.body74_crit_edge ]
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 %index107
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !9
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !9
  %54 = fmul <2 x double> %49, %wide.load117
  %55 = fmul <2 x double> %49, %wide.load118
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %index107
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !11, !noalias !13
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !11, !noalias !13
  %60 = fadd <2 x double> %54, %wide.load119
  %61 = fadd <2 x double> %55, %wide.load120
  store <2 x double> %60, <2 x double>* %57, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %61, <2 x double>* %59, align 8, !alias.scope !11, !noalias !13
  %index.next108 = add i64 %index107, 4
  %62 = icmp eq i64 %index.next108, %17
  br i1 %62, label %middle.block75, label %vector.body74.vector.body74_crit_edge, !llvm.loop !14

vector.body74.vector.body74_crit_edge:            ; preds = %vector.body74
  br label %vector.body74

middle.block75:                                   ; preds = %vector.body74
  br i1 %cmp.n110, label %middle.block75.._crit_edge.us.us_crit_edge, label %middle.block75.scalar.ph76.preheader_crit_edge

middle.block75.scalar.ph76.preheader_crit_edge:   ; preds = %middle.block75
  br label %scalar.ph76.preheader

middle.block75.._crit_edge.us.us_crit_edge:       ; preds = %middle.block75
  br label %._crit_edge.us.us

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph76
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %middle.block75.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, %wide.trip.count
  br i1 %exitcond38, label %._crit_edge9.us.loopexit, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

scalar.ph76:                                      ; preds = %scalar.ph76.scalar.ph76_crit_edge, %scalar.ph76.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %scalar.ph76.scalar.ph76_crit_edge ], [ %indvars.iv34.ph, %scalar.ph76.preheader ]
  %63 = load double, double* %46, align 8
  %64 = fmul double %63, %3
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 %indvars.iv34
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv34
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  store double %70, double* %68, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %71 = icmp slt i64 %indvars.iv.next35, %12
  br i1 %71, label %scalar.ph76.scalar.ph76_crit_edge, label %._crit_edge.us.us.loopexit, !llvm.loop !15

scalar.ph76.scalar.ph76_crit_edge:                ; preds = %scalar.ph76
  br label %scalar.ph76

.preheader5:                                      ; preds = %._crit_edge9.1..preheader5_crit_edge, %.preheader5.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.preheader5.preheader.new ], [ %indvars.iv.next49.1, %._crit_edge9.1..preheader5_crit_edge ]
  br i1 false, label %.preheader5..preheader.us_crit_edge, label %.preheader5.._crit_edge9_crit_edge

.preheader5.._crit_edge9_crit_edge:               ; preds = %.preheader5
  br label %._crit_edge9

.preheader5..preheader.us_crit_edge:              ; preds = %.preheader5
  br i1 undef, label %.preheader.us.scalar.ph.preheader_crit_edge, label %min.iters.checked

.preheader.us.scalar.ph.preheader_crit_edge:      ; preds = %.preheader5..preheader.us_crit_edge
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.preheader5..preheader.us_crit_edge
  br i1 undef, label %min.iters.checked.scalar.ph.preheader_crit_edge, label %vector.memcheck

min.iters.checked.scalar.ph.preheader_crit_edge:  ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %vector.memcheck.scalar.ph.preheader_crit_edge, label %vector.ph

vector.memcheck.scalar.ph.preheader_crit_edge:    ; preds = %vector.memcheck
  br label %scalar.ph.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br i1 undef, label %vector.body.._crit_edge.us_crit_edge, label %vector.body.scalar.ph.preheader_crit_edge

vector.body.scalar.ph.preheader_crit_edge:        ; preds = %vector.ph
  br label %scalar.ph.preheader

vector.body.._crit_edge.us_crit_edge:             ; preds = %vector.ph
  br label %._crit_edge.us

scalar.ph.preheader:                              ; preds = %vector.body.scalar.ph.preheader_crit_edge, %vector.memcheck.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.preheader.us.scalar.ph.preheader_crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %vector.body.._crit_edge.us_crit_edge, %scalar.ph.preheader
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader5.._crit_edge9_crit_edge, %._crit_edge.us
  br i1 false, label %.preheader5..preheader.us_crit_edge.1, label %._crit_edge9.._crit_edge9.1_crit_edge

._crit_edge9.._crit_edge9.1_crit_edge:            ; preds = %._crit_edge9
  br label %._crit_edge9.1

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit143.unr-lcssa:              ; preds = %._crit_edge9.1
  br label %._crit_edge14.loopexit143

._crit_edge14.loopexit143:                        ; preds = %.preheader5.prol.loopexit.._crit_edge14.loopexit143_crit_edge, %._crit_edge14.loopexit143.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit143, %._crit_edge14.loopexit
  br label %72

; <label>:72:                                     ; preds = %._crit_edge, %._crit_edge14
  ret void

.preheader5..preheader.us_crit_edge.1:            ; preds = %._crit_edge9
  br i1 undef, label %.preheader.us.1.scalar.ph.preheader.1_crit_edge, label %min.iters.checked.1

.preheader.us.1.scalar.ph.preheader.1_crit_edge:  ; preds = %.preheader5..preheader.us_crit_edge.1
  br label %scalar.ph.preheader.1

min.iters.checked.1:                              ; preds = %.preheader5..preheader.us_crit_edge.1
  br i1 undef, label %min.iters.checked.1.scalar.ph.preheader.1_crit_edge, label %vector.memcheck.1

min.iters.checked.1.scalar.ph.preheader.1_crit_edge: ; preds = %min.iters.checked.1
  br label %scalar.ph.preheader.1

vector.memcheck.1:                                ; preds = %min.iters.checked.1
  br i1 undef, label %vector.memcheck.1.scalar.ph.preheader.1_crit_edge, label %vector.ph.1

vector.memcheck.1.scalar.ph.preheader.1_crit_edge: ; preds = %vector.memcheck.1
  br label %scalar.ph.preheader.1

vector.ph.1:                                      ; preds = %vector.memcheck.1
  br i1 undef, label %vector.body.1.._crit_edge.us.1_crit_edge, label %vector.body.1.scalar.ph.preheader.1_crit_edge

vector.body.1.scalar.ph.preheader.1_crit_edge:    ; preds = %vector.ph.1
  br label %scalar.ph.preheader.1

vector.body.1.._crit_edge.us.1_crit_edge:         ; preds = %vector.ph.1
  br label %._crit_edge.us.1

scalar.ph.preheader.1:                            ; preds = %vector.body.1.scalar.ph.preheader.1_crit_edge, %vector.memcheck.1.scalar.ph.preheader.1_crit_edge, %min.iters.checked.1.scalar.ph.preheader.1_crit_edge, %.preheader.us.1.scalar.ph.preheader.1_crit_edge
  br label %._crit_edge.us.1

._crit_edge.us.1:                                 ; preds = %vector.body.1.._crit_edge.us.1_crit_edge, %scalar.ph.preheader.1
  br label %._crit_edge9.1

._crit_edge9.1:                                   ; preds = %._crit_edge9.._crit_edge9.1_crit_edge, %._crit_edge.us.1
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %73 = icmp slt i64 %indvars.iv.next49.1, %13
  br i1 %73, label %._crit_edge9.1..preheader5_crit_edge, label %._crit_edge14.loopexit143.unr-lcssa

._crit_edge9.1..preheader5_crit_edge:             ; preds = %._crit_edge9.1
  br label %.preheader5
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %24

.preheader.lr.ph:                                 ; preds = %3
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge4.loopexit8

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge2.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge2.us..preheader.us_crit_edge ]
  %11 = mul nsw i64 %10, %indvars.iv10
  br label %12

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us._crit_edge ], [ 0, %.preheader.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %12
  br label %._crit_edge.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %12

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %23 = icmp slt i64 %indvars.iv.next11, %10
  br i1 %23, label %._crit_edge2.us..preheader.us_crit_edge, label %._crit_edge4.loopexit

._crit_edge2.us..preheader.us_crit_edge:          ; preds = %._crit_edge2.us
  br label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge2.us
  br label %._crit_edge4

._crit_edge4.loopexit8:                           ; preds = %.preheader.lr.ph
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit8, %._crit_edge4.loopexit
  br label %24

; <label>:24:                                     ; preds = %._crit_edge, %._crit_edge4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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
