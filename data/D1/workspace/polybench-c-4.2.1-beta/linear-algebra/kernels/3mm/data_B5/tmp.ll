; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %22

; <label>:22:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader10.us.preheader, label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %14 = zext i32 %2 to i64
  %15 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next62, %._crit_edge27.us ]
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %16 ]
  %17 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv57
  store double %22, double* %23, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next58, %14
  br i1 %exitcond71, label %._crit_edge27.us, label %16

._crit_edge27.us:                                 ; preds = %16
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next62, %15
  br i1 %exitcond72, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %9
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %25 = icmp sgt i32 %1, 0
  %26 = mul nsw i32 %1, 5
  %27 = sitofp i32 %26 to double
  br i1 %25, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %28 = zext i32 %1 to i64
  %29 = zext i32 %2 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next53, %._crit_edge22.us ]
  br label %30

; <label>:30:                                     ; preds = %30, %.preheader8.us
  %indvars.iv48 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next49, %30 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %31 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %32 = add nuw nsw i64 %31, 2
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %27
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv48
  store double %36, double* %37, align 8
  %exitcond69 = icmp eq i64 %indvars.iv.next49, %28
  br i1 %exitcond69, label %._crit_edge22.us, label %30

._crit_edge22.us:                                 ; preds = %30
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next53, %29
  br i1 %exitcond70, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader10.lr.ph, %.preheader9
  %38 = icmp sgt i32 %1, 0
  br i1 %38, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %39 = icmp sgt i32 %4, 0
  %40 = mul nsw i32 %3, 5
  %41 = sitofp i32 %40 to double
  br i1 %39, label %.preheader6.us.preheader, label %._crit_edge14

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %42 = zext i32 %4 to i64
  %43 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next44, %._crit_edge17.us ]
  br label %44

; <label>:44:                                     ; preds = %44, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %44 ]
  %45 = add nuw nsw i64 %indvars.iv39, 3
  %46 = mul nuw nsw i64 %45, %indvars.iv43
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %3
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %41
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv39
  store double %50, double* %51, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next40, %42
  br i1 %exitcond67, label %._crit_edge17.us, label %44

._crit_edge17.us:                                 ; preds = %44
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next44, %43
  br i1 %exitcond68, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader8.lr.ph, %.preheader7
  %52 = icmp sgt i32 %4, 0
  br i1 %52, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %53 = icmp sgt i32 %3, 0
  %54 = mul nsw i32 %2, 5
  %55 = sitofp i32 %54 to double
  br i1 %53, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %56 = zext i32 %3 to i64
  %57 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us ]
  br label %58

; <label>:58:                                     ; preds = %58, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %58 ]
  %59 = add nuw nsw i64 %indvars.iv, 2
  %60 = mul nuw nsw i64 %59, %indvars.iv34
  %61 = add nuw nsw i64 %60, 2
  %62 = trunc i64 %61 to i32
  %63 = srem i32 %62, %2
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %55
  %66 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv34, i64 %indvars.iv
  store double %65, double* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next, %56
  br i1 %exitcond66, label %._crit_edge.us, label %58

._crit_edge.us:                                   ; preds = %58
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, %57
  br i1 %exitcond, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader6.lr.ph, %.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader10.us.preheader, label %.preheader.lr.ph

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %20 = zext i32 %1 to i64
  %21 = zext i32 %0 to i64
  %xtraiter105 = and i32 %2, 1
  %lcmp.mod106 = icmp eq i32 %xtraiter105, 0
  %22 = icmp eq i32 %2, 1
  %wide.trip.count101.1 = zext i32 %2 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge43.us, %.preheader10.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next114, %._crit_edge43.us ]
  br i1 %15, label %.lr.ph39.us.us.preheader, label %._crit_edge43.us.loopexit55

.lr.ph39.us.us.preheader:                         ; preds = %.preheader10.us
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 0
  br label %.lr.ph39.us.us

._crit_edge43.us.loopexit55:                      ; preds = %.preheader10.us
  %scevgep97 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv113, i64 0
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep9798, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge43.us

._crit_edge43.us.loopexit:                        ; preds = %._crit_edge40.us.us
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %._crit_edge43.us.loopexit55
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next114, %21
  br i1 %exitcond122, label %.preheader9.loopexit, label %.preheader10.us

.lr.ph39.us.us:                                   ; preds = %.lr.ph39.us.us.preheader, %._crit_edge40.us.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge40.us.us ], [ 0, %.lr.ph39.us.us.preheader ]
  %24 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv113, i64 %indvars.iv107
  store double 0.000000e+00, double* %24, align 8
  br i1 %lcmp.mod106, label %.prol.loopexit104, label %.prol.preheader103

.prol.preheader103:                               ; preds = %.lr.ph39.us.us
  %25 = load double, double* %23, align 8
  %26 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv107
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = load double, double* %24, align 8
  %30 = fadd double %29, %28
  store double %30, double* %24, align 8
  br label %.prol.loopexit104

.prol.loopexit104:                                ; preds = %.prol.preheader103, %.lr.ph39.us.us
  %indvars.iv99.unr.ph = phi i64 [ 1, %.prol.preheader103 ], [ 0, %.lr.ph39.us.us ]
  br i1 %22, label %._crit_edge40.us.us, label %.lr.ph39.us.us.new.preheader

.lr.ph39.us.us.new.preheader:                     ; preds = %.prol.loopexit104
  br label %.lr.ph39.us.us.new

._crit_edge40.us.us.loopexit:                     ; preds = %.lr.ph39.us.us.new
  br label %._crit_edge40.us.us

._crit_edge40.us.us:                              ; preds = %._crit_edge40.us.us.loopexit, %.prol.loopexit104
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next108, %20
  br i1 %exitcond121, label %._crit_edge43.us.loopexit, label %.lr.ph39.us.us

.lr.ph39.us.us.new:                               ; preds = %.lr.ph39.us.us.new.preheader, %.lr.ph39.us.us.new
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %.lr.ph39.us.us.new ], [ %indvars.iv99.unr.ph, %.lr.ph39.us.us.new.preheader ]
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv99
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv99, i64 %indvars.iv107
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %24, align 8
  %37 = fadd double %36, %35
  store double %37, double* %24, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv.next100
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next100, i64 %indvars.iv107
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %24, align 8
  %44 = fadd double %43, %42
  store double %44, double* %24, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, %wide.trip.count101.1
  br i1 %exitcond102.1, label %._crit_edge40.us.us.loopexit, label %.lr.ph39.us.us.new

.preheader9.loopexit:                             ; preds = %._crit_edge43.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %12
  %45 = icmp sgt i32 %1, 0
  br i1 %45, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %46 = icmp sgt i32 %3, 0
  %47 = icmp sgt i32 %4, 0
  br i1 %46, label %.preheader8.us.preheader, label %.preheader7

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %48 = add i32 %3, -1
  %49 = zext i32 %48 to i64
  %50 = shl nuw nsw i64 %49, 3
  %51 = add nuw nsw i64 %50, 8
  %52 = zext i32 %3 to i64
  %53 = zext i32 %1 to i64
  %xtraiter80 = and i32 %4, 1
  %lcmp.mod81 = icmp eq i32 %xtraiter80, 0
  %54 = icmp eq i32 %4, 1
  %wide.trip.count76.1 = zext i32 %4 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge29.us, %.preheader8.us.preheader
  %indvars.iv88 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next89, %._crit_edge29.us ]
  br i1 %47, label %.lr.ph25.us.us.preheader, label %._crit_edge29.us.loopexit53

.lr.ph25.us.us.preheader:                         ; preds = %.preheader8.us
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 0
  br label %.lr.ph25.us.us

._crit_edge29.us.loopexit53:                      ; preds = %.preheader8.us
  %scevgep72 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv88, i64 0
  %scevgep7273 = bitcast double* %scevgep72 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7273, i8 0, i64 %51, i32 8, i1 false)
  br label %._crit_edge29.us

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge26.us.us
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %._crit_edge29.us.loopexit53
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next89, %53
  br i1 %exitcond120, label %.preheader7.loopexit, label %.preheader8.us

.lr.ph25.us.us:                                   ; preds = %.lr.ph25.us.us.preheader, %._crit_edge26.us.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge26.us.us ], [ 0, %.lr.ph25.us.us.preheader ]
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv88, i64 %indvars.iv82
  store double 0.000000e+00, double* %56, align 8
  br i1 %lcmp.mod81, label %.prol.loopexit79, label %.prol.preheader78

.prol.preheader78:                                ; preds = %.lr.ph25.us.us
  %57 = load double, double* %55, align 8
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv82
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = load double, double* %56, align 8
  %62 = fadd double %61, %60
  store double %62, double* %56, align 8
  br label %.prol.loopexit79

.prol.loopexit79:                                 ; preds = %.prol.preheader78, %.lr.ph25.us.us
  %indvars.iv74.unr.ph = phi i64 [ 1, %.prol.preheader78 ], [ 0, %.lr.ph25.us.us ]
  br i1 %54, label %._crit_edge26.us.us, label %.lr.ph25.us.us.new.preheader

.lr.ph25.us.us.new.preheader:                     ; preds = %.prol.loopexit79
  br label %.lr.ph25.us.us.new

._crit_edge26.us.us.loopexit:                     ; preds = %.lr.ph25.us.us.new
  br label %._crit_edge26.us.us

._crit_edge26.us.us:                              ; preds = %._crit_edge26.us.us.loopexit, %.prol.loopexit79
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next83, %52
  br i1 %exitcond119, label %._crit_edge29.us.loopexit, label %.lr.ph25.us.us

.lr.ph25.us.us.new:                               ; preds = %.lr.ph25.us.us.new.preheader, %.lr.ph25.us.us.new
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph25.us.us.new ], [ %indvars.iv74.unr.ph, %.lr.ph25.us.us.new.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 %indvars.iv74
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv74, i64 %indvars.iv82
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = load double, double* %56, align 8
  %69 = fadd double %68, %67
  store double %69, double* %56, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 %indvars.iv.next75
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next75, i64 %indvars.iv82
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = load double, double* %56, align 8
  %76 = fadd double %75, %74
  store double %76, double* %56, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75.1, %wide.trip.count76.1
  br i1 %exitcond77.1, label %._crit_edge26.us.us.loopexit, label %.lr.ph25.us.us.new

.preheader7.loopexit:                             ; preds = %._crit_edge29.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader8.lr.ph, %.preheader9
  %77 = icmp sgt i32 %0, 0
  br i1 %77, label %.preheader.lr.ph, label %._crit_edge16

.preheader.lr.ph:                                 ; preds = %.preheader10.lr.ph, %.preheader7
  %78 = icmp sgt i32 %3, 0
  %79 = icmp sgt i32 %1, 0
  br i1 %78, label %.preheader.us.preheader, label %._crit_edge16

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %80 = add i32 %3, -1
  %81 = zext i32 %80 to i64
  %82 = shl nuw nsw i64 %81, 3
  %83 = add nuw nsw i64 %82, 8
  %84 = zext i32 %3 to i64
  %85 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %86 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge14.us, %.preheader.us.preheader
  %indvars.iv63 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next64, %._crit_edge14.us ]
  br i1 %79, label %.lr.ph.us.us.preheader, label %._crit_edge14.us.loopexit51

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %87 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit51:                      ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv63, i64 0
  %scevgep57 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep57, i8 0, i64 %83, i32 8, i1 false)
  br label %._crit_edge14.us

._crit_edge14.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %._crit_edge14.us.loopexit51
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, %85
  br i1 %exitcond, label %._crit_edge16.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %88 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv63, i64 %indvars.iv58
  store double 0.000000e+00, double* %88, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %89 = load double, double* %87, align 8
  %90 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv58
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = load double, double* %88, align 8
  %94 = fadd double %93, %92
  store double %94, double* %88, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %86, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next59, %84
  br i1 %exitcond118, label %._crit_edge14.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %95 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv58
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = load double, double* %88, align 8
  %101 = fadd double %100, %99
  store double %101, double* %88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv58
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = load double, double* %88, align 8
  %108 = fadd double %107, %106
  store double %108, double* %88, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader.lr.ph, %.preheader7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv6, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %15 = add nsw i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond11, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, %12
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
