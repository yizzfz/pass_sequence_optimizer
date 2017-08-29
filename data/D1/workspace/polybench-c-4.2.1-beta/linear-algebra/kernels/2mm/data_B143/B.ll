; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %22)
  br label %23

; <label>:23:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br i1 true, label %.preheader10.preheader.lr.ph, label %.preheader9

.preheader10.preheader.lr.ph:                     ; preds = %10
  br i1 true, label %.preheader10.preheader.us.preheader, label %.preheader7

.preheader10.preheader.us.preheader:              ; preds = %.preheader10.preheader.lr.ph
  br label %.preheader10.preheader.us

.preheader10.preheader.us:                        ; preds = %.preheader10.preheader.us.preheader, %.preheader10._crit_edge.us
  %indvars.iv2338.us = phi i64 [ %indvars.iv.next24.us, %.preheader10._crit_edge.us ], [ 0, %.preheader10.preheader.us.preheader ]
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.us, %.preheader10.preheader.us
  %indvars.iv2136.us = phi i64 [ 0, %.preheader10.preheader.us ], [ %indvars.iv.next22.us, %.preheader10.us ]
  %11 = mul nuw nsw i64 %indvars.iv2136.us, %indvars.iv2338.us
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv2338.us, i64 %indvars.iv2136.us
  store double %16, double* %17, align 8
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2136.us, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next22.us, 1100
  br i1 %exitcond52, label %.preheader10._crit_edge.us, label %.preheader10.us

.preheader10._crit_edge.us:                       ; preds = %.preheader10.us
  %indvars.iv.next24.us = add nuw nsw i64 %indvars.iv2338.us, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next24.us, 800
  br i1 %exitcond53, label %.preheader9.loopexit, label %.preheader10.preheader.us

.preheader9.loopexit:                             ; preds = %.preheader10._crit_edge.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %10
  br i1 true, label %.preheader8.preheader.lr.ph, label %.preheader7

.preheader8.preheader.lr.ph:                      ; preds = %.preheader9
  br i1 true, label %.preheader8.preheader.us.preheader, label %.preheader5

.preheader8.preheader.us.preheader:               ; preds = %.preheader8.preheader.lr.ph
  br label %.preheader8.preheader.us

.preheader8.preheader.us:                         ; preds = %.preheader8.preheader.us.preheader, %.preheader8._crit_edge.us
  %indvars.iv1934.us = phi i64 [ %indvars.iv.next20.us, %.preheader8._crit_edge.us ], [ 0, %.preheader8.preheader.us.preheader ]
  br i1 true, label %.preheader8.us.prol.loopexit, label %.preheader8.us.prol

.preheader8.us.prol:                              ; preds = %.preheader8.preheader.us
  br label %.preheader8.us.prol.loopexit

.preheader8.us.prol.loopexit:                     ; preds = %.preheader8.us.prol, %.preheader8.preheader.us
  %indvars.iv1732.us.unr.ph = phi i64 [ 1, %.preheader8.us.prol ], [ 0, %.preheader8.preheader.us ]
  br i1 false, label %.preheader8._crit_edge.us, label %.preheader8.us.preheader

.preheader8.us.preheader:                         ; preds = %.preheader8.us.prol.loopexit
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %.preheader8.us
  %indvars.iv1732.us = phi i64 [ %indvars.iv.next18.us.1, %.preheader8.us ], [ %indvars.iv1732.us.unr.ph, %.preheader8.us.preheader ]
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1732.us, 1
  %18 = mul nuw nsw i64 %indvars.iv.next18.us, %indvars.iv1934.us
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv1934.us, i64 %indvars.iv1732.us
  %indvars.iv.next18.us.1 = add nsw i64 %indvars.iv1732.us, 2
  %23 = mul nuw nsw i64 %indvars.iv.next18.us.1, %indvars.iv1934.us
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 900
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 9.000000e+02, double 9.000000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %exitcond49.1 = icmp eq i64 %indvars.iv.next18.us.1, 900
  br i1 %exitcond49.1, label %.preheader8._crit_edge.us.loopexit, label %.preheader8.us

.preheader8._crit_edge.us.loopexit:               ; preds = %.preheader8.us
  br label %.preheader8._crit_edge.us

.preheader8._crit_edge.us:                        ; preds = %.preheader8._crit_edge.us.loopexit, %.preheader8.us.prol.loopexit
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1934.us, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next20.us, 1100
  br i1 %exitcond50, label %.preheader7.loopexit, label %.preheader8.preheader.us

.preheader7.loopexit:                             ; preds = %.preheader8._crit_edge.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader10.preheader.lr.ph, %.preheader9
  br i1 true, label %.preheader6.preheader.lr.ph, label %.preheader5

.preheader6.preheader.lr.ph:                      ; preds = %.preheader7
  br i1 true, label %.preheader6.preheader.us.preheader, label %.preheader5

.preheader6.preheader.us.preheader:               ; preds = %.preheader6.preheader.lr.ph
  br label %.preheader6.preheader.us

.preheader6.preheader.us:                         ; preds = %.preheader6.preheader.us.preheader, %.preheader6._crit_edge.us
  %indvars.iv1530.us = phi i64 [ %indvars.iv.next16.us, %.preheader6._crit_edge.us ], [ 0, %.preheader6.preheader.us.preheader ]
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us, %.preheader6.preheader.us
  %indvars.iv1328.us = phi i64 [ 0, %.preheader6.preheader.us ], [ %indvars.iv.next14.us, %.preheader6.us ]
  %31 = add nuw nsw i64 %indvars.iv1328.us, 3
  %32 = mul nuw nsw i64 %31, %indvars.iv1530.us
  %33 = add nuw nsw i64 %32, 1
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 1200
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.200000e+03
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv1530.us, i64 %indvars.iv1328.us
  store double %37, double* %38, align 8
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1328.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next14.us, 1200
  br i1 %exitcond46, label %.preheader6._crit_edge.us, label %.preheader6.us

.preheader6._crit_edge.us:                        ; preds = %.preheader6.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1530.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next16.us, 900
  br i1 %exitcond47, label %.preheader5.loopexit, label %.preheader6.preheader.us

.preheader5.loopexit:                             ; preds = %.preheader6._crit_edge.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader8.preheader.lr.ph, %.preheader6.preheader.lr.ph, %.preheader7
  br i1 true, label %.preheader.preheader.lr.ph, label %._crit_edge

.preheader.preheader.lr.ph:                       ; preds = %.preheader5
  br i1 true, label %.preheader.preheader.us.preheader, label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.lr.ph
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv1126.us = phi i64 [ %indvars.iv.next12.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv25.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %39 = add nuw nsw i64 %indvars.iv25.us, 2
  %40 = mul nuw nsw i64 %39, %indvars.iv1126.us
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 1100
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, 1.100000e+03
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv1126.us, i64 %indvars.iv25.us
  store double %44, double* %45, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv25.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %.preheader._crit_edge.us, label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1126.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next12.us, 800
  br i1 %exitcond44, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader6.preheader.lr.ph, label %._crit_edge24

.preheader6.preheader.lr.ph:                      ; preds = %11
  br i1 true, label %.preheader6.preheader.us.preheader, label %.preheader.preheader.lr.ph

.preheader6.preheader.us.preheader:               ; preds = %.preheader6.preheader.lr.ph
  br label %.preheader6.preheader.us

.preheader6.preheader.us:                         ; preds = %.preheader6._crit_edge.us, %.preheader6.preheader.us.preheader
  %indvars.iv1542.us = phi i64 [ %indvars.iv.next16.us, %.preheader6._crit_edge.us ], [ 0, %.preheader6.preheader.us.preheader ]
  br i1 true, label %.lr.ph37.us.us.preheader, label %.preheader6._crit_edge.us.loopexit57

.lr.ph37.us.us.preheader:                         ; preds = %.preheader6.preheader.us
  br label %.lr.ph37.us.us

.preheader6._crit_edge.us.loopexit57:             ; preds = %.preheader6.preheader.us
  br label %.preheader6._crit_edge.us

.preheader6._crit_edge.us.loopexit:               ; preds = %._crit_edge38.us.us
  br label %.preheader6._crit_edge.us

.preheader6._crit_edge.us:                        ; preds = %.preheader6._crit_edge.us.loopexit, %.preheader6._crit_edge.us.loopexit57
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1542.us, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next16.us, 800
  br i1 %exitcond74, label %.preheader5, label %.preheader6.preheader.us

.lr.ph37.us.us:                                   ; preds = %.lr.ph37.us.us.preheader, %._crit_edge38.us.us
  %indvars.iv1339.us.us = phi i64 [ %indvars.iv.next14.us.us, %._crit_edge38.us.us ], [ 0, %.lr.ph37.us.us.preheader ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv1542.us, i64 %indvars.iv1339.us.us
  store double 0.000000e+00, double* %12, align 8
  br i1 true, label %.prol.loopexit68, label %.prol.preheader67

.prol.preheader67:                                ; preds = %.lr.ph37.us.us
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.prol.preheader67, %.lr.ph37.us.us
  %indvars.iv1135.us.us.unr.ph = phi i64 [ 1, %.prol.preheader67 ], [ 0, %.lr.ph37.us.us ]
  br i1 false, label %._crit_edge38.us.us, label %.lr.ph37.us.us.new.preheader

.lr.ph37.us.us.new.preheader:                     ; preds = %.prol.loopexit68
  br label %.lr.ph37.us.us.new

._crit_edge38.us.us.loopexit:                     ; preds = %.lr.ph37.us.us.new
  br label %._crit_edge38.us.us

._crit_edge38.us.us:                              ; preds = %._crit_edge38.us.us.loopexit, %.prol.loopexit68
  %indvars.iv.next14.us.us = add nuw nsw i64 %indvars.iv1339.us.us, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next14.us.us, 900
  br i1 %exitcond71, label %.preheader6._crit_edge.us.loopexit, label %.lr.ph37.us.us

.lr.ph37.us.us.new:                               ; preds = %.lr.ph37.us.us.new.preheader, %.lr.ph37.us.us.new
  %indvars.iv1135.us.us = phi i64 [ %indvars.iv.next12.us.us.1, %.lr.ph37.us.us.new ], [ %indvars.iv1135.us.us.unr.ph, %.lr.ph37.us.us.new.preheader ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv1542.us, i64 %indvars.iv1135.us.us
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv1135.us.us, i64 %indvars.iv1339.us.us
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %12, align 8
  %20 = fadd double %19, %18
  store double %20, double* %12, align 8
  %indvars.iv.next12.us.us = add nuw nsw i64 %indvars.iv1135.us.us, 1
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv1542.us, i64 %indvars.iv.next12.us.us
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next12.us.us, i64 %indvars.iv1339.us.us
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %12, align 8
  %28 = fadd double %27, %26
  store double %28, double* %12, align 8
  %indvars.iv.next12.us.us.1 = add nsw i64 %indvars.iv1135.us.us, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next12.us.us.1, 1100
  br i1 %exitcond66.1, label %._crit_edge38.us.us.loopexit, label %.lr.ph37.us.us.new

.preheader5:                                      ; preds = %.preheader6._crit_edge.us
  br i1 true, label %.preheader.preheader.lr.ph, label %._crit_edge24

.preheader.preheader.lr.ph:                       ; preds = %.preheader6.preheader.lr.ph, %.preheader5
  br i1 true, label %.preheader.preheader.us.preheader, label %._crit_edge24

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.lr.ph
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv921.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  br i1 true, label %.lr.ph.us.us.preheader, label %.preheader.us26.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.preheader.us
  br label %.lr.ph.us.us

.preheader.us26.preheader:                        ; preds = %.preheader.preheader.us
  br i1 undef, label %.preheader.us26.prol.loopexit, label %.preheader.us26.prol.preheader

.preheader.us26.prol.preheader:                   ; preds = %.preheader.us26.preheader
  br label %.preheader.us26.prol

.preheader.us26.prol:                             ; preds = %.preheader.us26.prol.preheader, %.preheader.us26.prol
  br i1 true, label %.preheader.us26.prol.loopexit.loopexit, label %.preheader.us26.prol, !llvm.loop !1

.preheader.us26.prol.loopexit.loopexit:           ; preds = %.preheader.us26.prol
  br label %.preheader.us26.prol.loopexit

.preheader.us26.prol.loopexit:                    ; preds = %.preheader.us26.prol.loopexit.loopexit, %.preheader.us26.preheader
  br i1 undef, label %.preheader._crit_edge.us, label %.preheader.us26.preheader82

.preheader.us26.preheader82:                      ; preds = %.preheader.us26.prol.loopexit
  br label %.preheader.us26

.preheader.us26:                                  ; preds = %.preheader.us26.preheader82, %.preheader.us26
  br i1 true, label %.preheader._crit_edge.us.loopexit83, label %.preheader.us26

.preheader._crit_edge.us.loopexit:                ; preds = %._crit_edge.us.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us.loopexit83:              ; preds = %.preheader.us26
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit83, %.preheader._crit_edge.us.loopexit, %.preheader.us26.prol.loopexit
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv921.us, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next10.us, 800
  br i1 %exitcond62, label %._crit_edge24.loopexit, label %.preheader.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv718.us.us = phi i64 [ %indvars.iv.next8.us.us, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv921.us, i64 %indvars.iv718.us.us
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %5
  store double %31, double* %29, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv17.us.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next8.us.us = add nuw nsw i64 %indvars.iv718.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next8.us.us, 1200
  br i1 %exitcond, label %.preheader._crit_edge.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv17.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv17.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %32 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv921.us, i64 %indvars.iv17.us.us
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv17.us.us, i64 %indvars.iv718.us.us
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %29, align 8
  %38 = fadd double %37, %36
  store double %38, double* %29, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv17.us.us, 1
  %39 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv921.us, i64 %indvars.iv.next.us.us
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next.us.us, i64 %indvars.iv718.us.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %29, align 8
  %45 = fadd double %44, %43
  store double %45, double* %29, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv17.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge24.loopexit:                           ; preds = %.preheader._crit_edge.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %11, %.preheader.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader.us.preheader, label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %3
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv25.us = phi i64 [ %indvars.iv.next3.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %8 = mul nsw i64 %indvars.iv25.us, 800
  br label %9

; <label>:9:                                      ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %10 = add nsw i64 %indvars.iv4.us, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.preheader.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %14, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25.us, i64 %indvars.iv4.us
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %.preheader._crit_edge.us, label %9

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv25.us, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3.us, 800
  br i1 %exitcond8, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
