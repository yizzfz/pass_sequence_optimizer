; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
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
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
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
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %10
  %12 = icmp sgt i32 %2, 0
  %13 = sitofp i32 %0 to double
  br i1 %12, label %.preheader10.us.preheader, label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %wide.trip.count59 = zext i32 %2 to i64
  %wide.trip.count63 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next62, %._crit_edge27.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
  store double %19, double* %20, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %10
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %22 = icmp sgt i32 %1, 0
  %23 = sitofp i32 %1 to double
  br i1 %22, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %xtraiter = and i32 %1, 1
  %wide.trip.count54 = zext i32 %2 to i64
  %wide.trip.count50.1 = zext i32 %1 to i64
  %24 = icmp eq i32 %xtraiter, 0
  %25 = icmp eq i32 %1, 1
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next53, %._crit_edge22.us ]
  br i1 %24, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader8.us
  %26 = trunc i64 %indvars.iv52 to i32
  %27 = srem i32 %26, %1
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, %23
  %30 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 0
  store double %29, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader8.us, %.prol.preheader
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader8.us ]
  br i1 %25, label %._crit_edge22.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader8.us.new ], [ %indvars.iv48.unr.ph, %.preheader8.us.new.preheader ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %31 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %23
  %36 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv48
  store double %35, double* %36, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %37 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %1
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %23
  %42 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv.next49
  store double %41, double* %42, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %._crit_edge22.us.loopexit, label %.preheader8.us.new

._crit_edge22.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9, %.preheader10.lr.ph
  %43 = icmp sgt i32 %1, 0
  br i1 %43, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %44 = icmp sgt i32 %3, 0
  %45 = sitofp i32 %3 to double
  br i1 %44, label %.preheader6.us.preheader, label %.preheader5

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %3 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next44, %._crit_edge17.us ]
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge66 ]
  %46 = add nuw nsw i64 %indvars.iv39, 3
  %47 = mul nuw nsw i64 %46, %indvars.iv43
  %48 = add nuw nsw i64 %47, 1
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, %3
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %45
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv43, i64 %indvars.iv39
  store double %52, double* %53, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge66

._crit_edge17.us:                                 ; preds = %._crit_edge66
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader6.lr.ph, %.preheader7, %.preheader8.lr.ph
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %54 = icmp sgt i32 %3, 0
  %55 = sitofp i32 %2 to double
  br i1 %54, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us ]
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge67 ]
  %56 = add nuw nsw i64 %indvars.iv, 2
  %57 = mul nuw nsw i64 %56, %indvars.iv34
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, %2
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, %55
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv
  store double %61, double* %62, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge67

._crit_edge.us:                                   ; preds = %._crit_edge67
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader6.lr.ph, label %._crit_edge12

.preheader6.lr.ph:                                ; preds = %11
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.preheader6.us.preheader, label %.preheader.lr.ph

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %14 = add i32 %1, -1
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nuw nsw i64 %16, 8
  %wide.trip.count72 = zext i32 %0 to i64
  %xtraiter62 = and i32 %2, 1
  %wide.trip.count66 = zext i32 %1 to i64
  %wide.trip.count58.1 = zext i32 %2 to i64
  %18 = icmp sgt i32 %2, 0
  %19 = icmp eq i32 %xtraiter62, 0
  %20 = icmp eq i32 %2, 1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %.preheader6.us.preheader
  %indvars.iv70 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next71, %._crit_edge25.us ]
  br i1 %18, label %.lr.ph21.us.us.preheader, label %._crit_edge25.us.loopexit35

.lr.ph21.us.us.preheader:                         ; preds = %.preheader6.us
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 0
  br label %.lr.ph21.us.us

._crit_edge25.us.loopexit35:                      ; preds = %.preheader6.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 0
  %scevgep55 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep55, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge25.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %._crit_edge25.us.loopexit35
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %.preheader.lr.ph.loopexit, label %.preheader6.us

.lr.ph21.us.us:                                   ; preds = %._crit_edge22.us.us, %.lr.ph21.us.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.lr.ph21.us.us.preheader ], [ %indvars.iv.next65, %._crit_edge22.us.us ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv64
  store double 0.000000e+00, double* %22, align 8
  br i1 %19, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph21.us.us
  %23 = load double, double* %21, align 8
  %24 = fmul double %23, %4
  %25 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv64
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %27, 0.000000e+00
  store double %28, double* %22, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph21.us.us, %.prol.preheader60
  %29 = phi double [ %28, %.prol.preheader60 ], [ 0.000000e+00, %.lr.ph21.us.us ]
  %indvars.iv56.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph21.us.us ]
  br i1 %20, label %._crit_edge22.us.us, label %.lr.ph21.us.us.new.preheader

.lr.ph21.us.us.new.preheader:                     ; preds = %.prol.loopexit61
  br label %.lr.ph21.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.lr.ph21.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit61
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge25.us.loopexit, label %.lr.ph21.us.us

.lr.ph21.us.us.new:                               ; preds = %.lr.ph21.us.us.new.preheader, %.lr.ph21.us.us.new
  %30 = phi double [ %44, %.lr.ph21.us.us.new ], [ %29, %.lr.ph21.us.us.new.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.lr.ph21.us.us.new ], [ %indvars.iv56.unr.ph, %.lr.ph21.us.us.new.preheader ]
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv56
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %4
  %34 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv56, i64 %indvars.iv64
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %30, %36
  store double %37, double* %22, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv.next57
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %4
  %41 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next57, i64 %indvars.iv64
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %37, %43
  store double %44, double* %22, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, %wide.trip.count58.1
  br i1 %exitcond59.1, label %._crit_edge22.us.us.loopexit, label %.lr.ph21.us.us.new

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge25.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader6.lr.ph
  %45 = icmp sgt i32 %3, 0
  br i1 %45, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %46 = add i32 %3, -1
  %wide.trip.count48 = zext i32 %0 to i64
  %xtraiter = and i32 %3, 3
  %wide.trip.count.3 = zext i32 %3 to i64
  %xtraiter40 = and i32 %1, 1
  %wide.trip.count39.1 = zext i32 %1 to i64
  %47 = add nsw i64 %wide.trip.count.3, -4
  %48 = icmp eq i32 %xtraiter40, 0
  %49 = icmp eq i32 %1, 1
  %50 = icmp eq i32 %xtraiter, 0
  %51 = icmp ult i32 %46, 3
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge10.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge10.us ]
  br i1 %13, label %.lr.ph.us.us.preheader, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %52 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 0
  br label %.lr.ph.us.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader:     ; preds = %.preheader.us
  br i1 %50, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader

.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol:          ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader, %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph9..lr.ph9.split_crit_edge.us.prol ], [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph9..lr.ph9.split_crit_edge.us.prol ], [ %xtraiter, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.prol
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %5
  store double %55, double* %53, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol, !llvm.loop !1

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader ], [ %indvars.iv.next.prol, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit ]
  br i1 %51, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78

.lr.ph9..lr.ph9.split_crit_edge.us.preheader78:   ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  %56 = sub i64 %47, %indvars.iv.unr
  %57 = lshr i64 %56, 2
  %58 = add nuw nsw i64 %57, 1
  %min.iters.check = icmp ult i64 %58, 2
  br i1 %min.iters.check, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  %n.mod.vf = and i64 %58, 1
  %n.vec = sub nsw i64 %58, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %59 = add i64 %indvars.iv.unr, 4
  %60 = shl nuw i64 %57, 2
  %61 = add i64 %59, %60
  %62 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %61, %62
  br i1 %cmp.zero, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %63 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv.unr, %63
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %offset.idx
  %65 = bitcast double* %64 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %65, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec81 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec82 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec83 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %66 = fmul <2 x double> %strided.vec, %broadcast.splat85
  %67 = fmul <2 x double> %strided.vec81, %broadcast.splat85
  %68 = fmul <2 x double> %strided.vec82, %broadcast.splat85
  %69 = add nsw i64 %offset.idx, 3
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %69
  %71 = fmul <2 x double> %strided.vec83, %broadcast.splat85
  %72 = getelementptr double, double* %70, i64 -3
  %73 = bitcast double* %72 to <8 x double>*
  %74 = shufflevector <2 x double> %66, <2 x double> %67, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %75 = shufflevector <2 x double> %68, <2 x double> %71, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %74, <4 x double> %75, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %73, align 8
  %index.next = add i64 %index, 2
  %76 = icmp eq i64 %index.next, %n.vec
  br i1 %76, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86

.lr.ph9..lr.ph9.split_crit_edge.us.preheader86:   ; preds = %middle.block, %min.iters.checked, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78 ]
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

.lr.ph9..lr.ph9.split_crit_edge.us:               ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86, %.lr.ph9..lr.ph9.split_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph9..lr.ph9.split_crit_edge.us ], [ %indvars.iv.ph, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86 ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %5
  store double %79, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %5
  store double %82, double* %80, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, %5
  store double %85, double* %83, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %5
  store double %88, double* %86, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge10.us.loopexit87, label %.lr.ph9..lr.ph9.split_crit_edge.us, !llvm.loop !6

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge10.us

._crit_edge10.us.loopexit87:                      ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit87, %._crit_edge10.us.loopexit, %middle.block, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next44, %._crit_edge.us.us ]
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv43
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, %5
  store double %91, double* %89, align 8
  br i1 %48, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %92 = load double, double* %52, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv43
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fadd double %91, %95
  store double %96, double* %89, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %97 = phi double [ %96, %.prol.preheader ], [ %91, %.lr.ph.us.us ]
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %49, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count.3
  br i1 %exitcond, label %._crit_edge10.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %98 = phi double [ %110, %.lr.ph.us.us.new ], [ %97, %.lr.ph.us.us.new.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph.us.us.new ], [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new.preheader ]
  %99 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv37
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv37, i64 %indvars.iv43
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fadd double %98, %103
  store double %104, double* %89, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %105 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv.next38
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next38, i64 %indvars.iv43
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fadd double %104, %109
  store double %110, double* %89, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader.lr.ph, %11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
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
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
