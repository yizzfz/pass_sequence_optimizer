; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader48.lr.ph, label %._crit_edge92.thread

._crit_edge92.thread:                             ; preds = %2
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge53

.preheader48.lr.ph:                               ; preds = %2
  %6 = sitofp i32 %0 to double
  %7 = shl nsw i64 %3, 3
  %8 = add nsw i64 %7, -8
  br label %.preheader48

.preheader48:                                     ; preds = %._crit_edge87..preheader48_crit_edge, %.preheader48.lr.ph
  %indvars.iv = phi i64 [ 1, %.preheader48.lr.ph ], [ %indvars.iv.next109, %._crit_edge87..preheader48_crit_edge ]
  %indvars.iv4088 = phi i64 [ 0, %.preheader48.lr.ph ], [ %indvars.iv.next41, %._crit_edge87..preheader48_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv4088, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep107 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep107108 = bitcast double* %scevgep107 to i8*
  %11 = mul nsw i64 %indvars.iv4088, -8
  %12 = add nsw i64 %8, %11
  br label %._crit_edge114

.preheader47:                                     ; preds = %._crit_edge114
  %exitcond3784 = icmp eq i64 %indvars.iv, %3
  br i1 %exitcond3784, label %._crit_edge87, label %._crit_edge87.loopexit

._crit_edge114:                                   ; preds = %._crit_edge114, %.preheader48
  %indvars.iv2683 = phi i64 [ 0, %.preheader48 ], [ %indvars.iv.next27, %._crit_edge114 ]
  %13 = sub nsw i64 0, %indvars.iv2683
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %6
  %18 = fadd double %17, 1.000000e+00
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4088, i64 %indvars.iv2683
  store double %18, double* %19, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2683, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next27, %indvars.iv
  br i1 %exitcond31, label %.preheader47, label %._crit_edge114

._crit_edge87.loopexit:                           ; preds = %.preheader47
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep107108, i8 0, i64 %12, i32 8, i1 false)
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %.preheader47, %._crit_edge87.loopexit
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4088, i64 %indvars.iv4088
  store double 1.000000e+00, double* %20, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv4088, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next41, %3
  br i1 %exitcond110, label %._crit_edge92, label %._crit_edge87..preheader48_crit_edge

._crit_edge87..preheader48_crit_edge:             ; preds = %._crit_edge87
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader48

._crit_edge92:                                    ; preds = %._crit_edge87
  %21 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %22 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %23 = icmp sgt i32 %0, 0
  br i1 %23, label %.preheader46.preheader, label %._crit_edge53

.preheader46.preheader:                           ; preds = %._crit_edge92
  %wide.trip.count22 = zext i32 %0 to i64
  %24 = shl nuw nsw i64 %wide.trip.count22, 3
  %25 = add nsw i64 %3, -1
  %xtraiter104 = and i64 %3, 3
  %lcmp.mod105 = icmp eq i64 %xtraiter104, 0
  br i1 %lcmp.mod105, label %.preheader46.prol.loopexit, label %._crit_edge80.prol.preheader

._crit_edge80.prol.preheader:                     ; preds = %.preheader46.preheader
  br label %._crit_edge80.prol

._crit_edge80.prol:                               ; preds = %._crit_edge80.prol.preheader, %._crit_edge80.prol
  %indvars.iv2481.prol = phi i64 [ %indvars.iv.next25.prol, %._crit_edge80.prol ], [ 0, %._crit_edge80.prol.preheader ]
  %prol.iter106 = phi i64 [ %prol.iter106.sub, %._crit_edge80.prol ], [ %xtraiter104, %._crit_edge80.prol.preheader ]
  %26 = mul nuw nsw i64 %indvars.iv2481.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %21, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next25.prol = add nuw nsw i64 %indvars.iv2481.prol, 1
  %prol.iter106.sub = add i64 %prol.iter106, -1
  %prol.iter106.cmp = icmp eq i64 %prol.iter106.sub, 0
  br i1 %prol.iter106.cmp, label %.preheader46.prol.loopexit.loopexit, label %._crit_edge80.prol, !llvm.loop !1

.preheader46.prol.loopexit.loopexit:              ; preds = %._crit_edge80.prol
  br label %.preheader46.prol.loopexit

.preheader46.prol.loopexit:                       ; preds = %.preheader46.prol.loopexit.loopexit, %.preheader46.preheader
  %indvars.iv2481.unr = phi i64 [ 0, %.preheader46.preheader ], [ %indvars.iv.next25.prol, %.preheader46.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %25, 3
  br i1 %27, label %.preheader45, label %._crit_edge80.3.preheader

._crit_edge80.3.preheader:                        ; preds = %.preheader46.prol.loopexit
  %28 = add nsw i64 %3, -4
  %29 = sub i64 %28, %indvars.iv2481.unr
  %30 = lshr i64 %29, 2
  %31 = and i64 %30, 1
  %lcmp.mod116 = icmp eq i64 %31, 0
  br i1 %lcmp.mod116, label %._crit_edge80.3.prol.preheader, label %._crit_edge80.3.prol.loopexit

._crit_edge80.3.prol.preheader:                   ; preds = %._crit_edge80.3.preheader
  br label %._crit_edge80.3.prol

._crit_edge80.3.prol:                             ; preds = %._crit_edge80.3.prol.preheader
  %32 = mul nuw nsw i64 %indvars.iv2481.unr, 16000
  %scevgep.prol118 = getelementptr i8, i8* %21, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol118, i8 0, i64 %24, i32 8, i1 false)
  %33 = mul i64 %indvars.iv2481.unr, 16000
  %34 = add i64 %33, 16000
  %scevgep.1.prol = getelementptr i8, i8* %21, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %24, i32 8, i1 false)
  %35 = mul i64 %indvars.iv2481.unr, 16000
  %36 = add i64 %35, 32000
  %scevgep.2.prol = getelementptr i8, i8* %21, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %24, i32 8, i1 false)
  %37 = mul i64 %indvars.iv2481.unr, 16000
  %38 = add i64 %37, 48000
  %scevgep.3.prol = getelementptr i8, i8* %21, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next25.3.prol = add nsw i64 %indvars.iv2481.unr, 4
  br label %._crit_edge80.3.prol.loopexit

._crit_edge80.3.prol.loopexit:                    ; preds = %._crit_edge80.3.prol, %._crit_edge80.3.preheader
  %indvars.iv2481.unr119 = phi i64 [ %indvars.iv2481.unr, %._crit_edge80.3.preheader ], [ %indvars.iv.next25.3.prol, %._crit_edge80.3.prol ]
  %39 = icmp eq i64 %30, 0
  br i1 %39, label %.preheader45.loopexit, label %._crit_edge80.3.preheader.new

._crit_edge80.3.preheader.new:                    ; preds = %._crit_edge80.3.prol.loopexit
  br label %._crit_edge80.3

.preheader45.loopexit.unr-lcssa:                  ; preds = %._crit_edge80.3
  br label %.preheader45.loopexit

.preheader45.loopexit:                            ; preds = %._crit_edge80.3.prol.loopexit, %.preheader45.loopexit.unr-lcssa
  br label %.preheader45

.preheader45:                                     ; preds = %.preheader45.loopexit, %.preheader46.prol.loopexit
  %40 = icmp sgt i32 %0, 0
  br i1 %40, label %.preheader44.preheader, label %._crit_edge53

.preheader44.preheader:                           ; preds = %.preheader45
  %wide.trip.count16 = zext i32 %0 to i64
  %xtraiter100 = and i64 %wide.trip.count16, 1
  %lcmp.mod101 = icmp eq i64 %xtraiter100, 0
  %41 = icmp eq i32 %0, 1
  br label %.preheader43.preheader

.preheader43.preheader:                           ; preds = %._crit_edge61, %.preheader44.preheader
  %indvars.iv1862 = phi i64 [ 0, %.preheader44.preheader ], [ %indvars.iv.next19, %._crit_edge61 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv1862
  br label %.preheader43

.preheader42:                                     ; preds = %._crit_edge61
  %43 = icmp sgt i32 %0, 0
  br i1 %43, label %.preheader.preheader, label %._crit_edge53

.preheader.preheader:                             ; preds = %.preheader42
  %wide.trip.count = zext i32 %0 to i64
  %44 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %45 = icmp ult i64 %44, 3
  br label %.preheader

.preheader43:                                     ; preds = %._crit_edge57, %.preheader43.preheader
  %indvars.iv1459 = phi i64 [ 0, %.preheader43.preheader ], [ %indvars.iv.next15, %._crit_edge57 ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1459, i64 %indvars.iv1862
  br i1 %lcmp.mod101, label %.prol.loopexit99, label %.prol.preheader98

.prol.preheader98:                                ; preds = %.preheader43
  %47 = load double, double* %46, align 8
  %48 = load double, double* %42, align 8
  %49 = fmul double %47, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv1459, i64 0
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  br label %.prol.loopexit99

.prol.loopexit99:                                 ; preds = %.preheader43, %.prol.preheader98
  %indvars.iv1055.unr.ph = phi i64 [ 1, %.prol.preheader98 ], [ 0, %.preheader43 ]
  br i1 %41, label %._crit_edge57, label %.preheader43.new.preheader

.preheader43.new.preheader:                       ; preds = %.prol.loopexit99
  br label %.preheader43.new

.preheader43.new:                                 ; preds = %.preheader43.new.preheader, %.preheader43.new
  %indvars.iv1055 = phi i64 [ %indvars.iv.next11.1, %.preheader43.new ], [ %indvars.iv1055.unr.ph, %.preheader43.new.preheader ]
  %53 = load double, double* %46, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1055, i64 %indvars.iv1862
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv1459, i64 %indvars.iv1055
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1055, 1
  %60 = load double, double* %46, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv1862
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv1459, i64 %indvars.iv.next11
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv1055, 2
  %exitcond13.1 = icmp eq i64 %indvars.iv.next11.1, %wide.trip.count16
  br i1 %exitcond13.1, label %._crit_edge57.loopexit, label %.preheader43.new

._crit_edge57.loopexit:                           ; preds = %.preheader43.new
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.loopexit, %.prol.loopexit99
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1459, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge61, label %.preheader43

._crit_edge61:                                    ; preds = %._crit_edge57
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1862, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next19, %3
  br i1 %exitcond102, label %.preheader42, label %.preheader43.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv851 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next9, %._crit_edge ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv851, i64 %indvars.iv50.prol
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv851, i64 %indvars.iv50.prol
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader
  %indvars.iv50.unr = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %45, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv.next.3, %.preheader.new ], [ %indvars.iv50.unr, %.preheader.new.preheader ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv851, i64 %indvars.iv50
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv851, i64 %indvars.iv50
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv50, 1
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv851, i64 %indvars.iv.next
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv851, i64 %indvars.iv.next
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv50, 2
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv851, i64 %indvars.iv.next.1
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv851, i64 %indvars.iv.next.1
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv50, 3
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv851, i64 %indvars.iv.next.2
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv851, i64 %indvars.iv.next.2
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv50, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv851, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, %3
  br i1 %exitcond, label %._crit_edge53.loopexit, label %.preheader

._crit_edge53.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %.preheader42, %.preheader45, %._crit_edge92, %._crit_edge92.thread
  %92 = phi i8* [ %5, %._crit_edge92.thread ], [ %21, %._crit_edge92 ], [ %21, %.preheader45 ], [ %21, %.preheader42 ], [ %21, %._crit_edge53.loopexit ]
  tail call void @free(i8* %92) #4
  ret void

._crit_edge80.3:                                  ; preds = %._crit_edge80.3, %._crit_edge80.3.preheader.new
  %indvars.iv2481 = phi i64 [ %indvars.iv2481.unr119, %._crit_edge80.3.preheader.new ], [ %indvars.iv.next25.3.1, %._crit_edge80.3 ]
  %93 = mul nuw nsw i64 %indvars.iv2481, 16000
  %scevgep = getelementptr i8, i8* %21, i64 %93
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %24, i32 8, i1 false)
  %94 = mul i64 %indvars.iv2481, 16000
  %95 = add i64 %94, 16000
  %scevgep.1 = getelementptr i8, i8* %21, i64 %95
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %24, i32 8, i1 false)
  %96 = mul i64 %indvars.iv2481, 16000
  %97 = add i64 %96, 32000
  %scevgep.2 = getelementptr i8, i8* %21, i64 %97
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %24, i32 8, i1 false)
  %98 = mul i64 %indvars.iv2481, 16000
  %99 = add i64 %98, 48000
  %scevgep.3 = getelementptr i8, i8* %21, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next25.3 = add nsw i64 %indvars.iv2481, 4
  %100 = mul nuw nsw i64 %indvars.iv.next25.3, 16000
  %scevgep.1120 = getelementptr i8, i8* %21, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1120, i8 0, i64 %24, i32 8, i1 false)
  %101 = mul i64 %indvars.iv.next25.3, 16000
  %102 = add i64 %101, 16000
  %scevgep.1.1 = getelementptr i8, i8* %21, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %24, i32 8, i1 false)
  %103 = mul i64 %indvars.iv.next25.3, 16000
  %104 = add i64 %103, 32000
  %scevgep.2.1 = getelementptr i8, i8* %21, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %24, i32 8, i1 false)
  %105 = mul i64 %indvars.iv.next25.3, 16000
  %106 = add i64 %105, 48000
  %scevgep.3.1 = getelementptr i8, i8* %21, i64 %106
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next25.3.1 = add nsw i64 %indvars.iv2481, 8
  %exitcond103.3.1 = icmp eq i64 %indvars.iv.next25.3.1, %3
  br i1 %exitcond103.3.1, label %.preheader45.loopexit.unr-lcssa, label %._crit_edge80.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader27.lr.ph, label %._crit_edge43

.preheader27.lr.ph:                               ; preds = %2
  %wide.trip.count21 = zext i32 %0 to i64
  br label %.preheader27

.preheader27:                                     ; preds = %._crit_edge39, %.preheader27.lr.ph
  %indvars.iv2340 = phi i64 [ 0, %.preheader27.lr.ph ], [ %indvars.iv.next24, %._crit_edge39 ]
  %exitcond1130 = icmp eq i64 %indvars.iv2340, 0
  br i1 %exitcond1130, label %.preheader26, label %.preheader25.preheader

.preheader25.preheader:                           ; preds = %.preheader27
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 0
  br label %.preheader25

.preheader26.loopexit:                            ; preds = %._crit_edge
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %.preheader27
  %exitcond2236 = icmp eq i64 %indvars.iv2340, %wide.trip.count21
  %exitcond1632 = icmp eq i64 %indvars.iv2340, 0
  %or.cond = or i1 %exitcond2236, %exitcond1632
  br i1 %or.cond, label %._crit_edge39, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader26
  %xtraiter47 = and i64 %indvars.iv2340, 1
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  %6 = icmp eq i64 %indvars.iv2340, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 0
  br label %.preheader

.preheader25:                                     ; preds = %._crit_edge, %.preheader25.preheader
  %indvars.iv631 = phi i64 [ 0, %.preheader25.preheader ], [ %indvars.iv.next7, %._crit_edge ]
  %exitcond28 = icmp eq i64 %indvars.iv631, 0
  br i1 %exitcond28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader25
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv631
  %xtraiter = and i64 %indvars.iv631, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = load double, double* %5, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv631
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = load double, double* %8, align 8
  %14 = fsub double %13, %12
  store double %14, double* %8, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %15 = icmp eq i64 %indvars.iv631, 1
  br i1 %15, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv29.unr.ph, %.lr.ph.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv29
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv631
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = load double, double* %8, align 8
  %22 = fsub double %21, %20
  store double %22, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv29, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv631
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = load double, double* %8, align 8
  %29 = fsub double %28, %27
  store double %29, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv29, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv631
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader25
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv631, i64 %indvars.iv631
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv631
  %33 = load double, double* %32, align 8
  %34 = fdiv double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv631, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, %indvars.iv2340
  br i1 %exitcond11, label %.preheader26.loopexit, label %.preheader25

.preheader:                                       ; preds = %._crit_edge35, %.preheader.preheader
  %indvars.iv1937 = phi i64 [ %indvars.iv2340, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge35 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv1937
  br i1 %lcmp.mod48, label %.prol.loopexit46, label %.prol.preheader45

.prol.preheader45:                                ; preds = %.preheader
  %36 = load double, double* %7, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv1937
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %35, align 8
  %41 = fsub double %40, %39
  store double %41, double* %35, align 8
  br label %.prol.loopexit46

.prol.loopexit46:                                 ; preds = %.preheader, %.prol.preheader45
  %indvars.iv1233.unr.ph = phi i64 [ 1, %.prol.preheader45 ], [ 0, %.preheader ]
  br i1 %6, label %._crit_edge35, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit46
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv1233 = phi i64 [ %indvars.iv.next13.1, %.preheader.new ], [ %indvars.iv1233.unr.ph, %.preheader.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv1233
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1233, i64 %indvars.iv1937
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %35, align 8
  %48 = fsub double %47, %46
  store double %48, double* %35, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1233, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2340, i64 %indvars.iv.next13
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next13, i64 %indvars.iv1937
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %35, align 8
  %55 = fsub double %54, %53
  store double %55, double* %35, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1233, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next13.1, %indvars.iv2340
  br i1 %exitcond16.1, label %._crit_edge35.loopexit, label %.preheader.new

._crit_edge35.loopexit:                           ; preds = %.preheader.new
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %.prol.loopexit46
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1937, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge39.loopexit, label %.preheader

._crit_edge39.loopexit:                           ; preds = %._crit_edge35
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader26
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2340, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %3
  br i1 %exitcond, label %._crit_edge43.loopexit, label %.preheader27

._crit_edge43.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next3, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge11 ]
  %10 = add nsw i64 %indvars.iv5, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge11

; <label>:14:                                     ; preds = %._crit_edge12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %._crit_edge12

._crit_edge:                                      ; preds = %._crit_edge11
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond10, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
!3 = distinct !{!3, !2}
