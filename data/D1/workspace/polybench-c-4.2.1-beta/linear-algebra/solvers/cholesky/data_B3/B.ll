; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader73.lr.ph, label %._crit_edge95.thread

._crit_edge95.thread:                             ; preds = %2
  br label %._crit_edge76

.preheader73.lr.ph:                               ; preds = %2
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge93, %.preheader73.lr.ph
  %indvars.iv134 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next135, %._crit_edge93 ]
  %indvars.iv132 = phi i64 [ 1, %.preheader73.lr.ph ], [ %indvars.iv.next133, %._crit_edge93 ]
  %3 = mul i64 %indvars.iv134, 2001
  %4 = add i64 %3, 1
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %5 = mul i64 %indvars.iv134, -8
  br label %6

; <label>:6:                                      ; preds = %.preheader73, %6
  %indvars.iv120 = phi i64 [ 0, %.preheader73 ], [ %indvars.iv.next121, %6 ]
  %7 = sub nsw i64 0, %indvars.iv120
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv120
  store double %12, double* %13, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next121, %indvars.iv132
  br i1 %exitcond125, label %._crit_edge89, label %6

._crit_edge89:                                    ; preds = %6
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %14 = icmp slt i64 %indvars.iv.next135, 2000
  br i1 %14, label %._crit_edge93.loopexit, label %._crit_edge93

._crit_edge93.loopexit:                           ; preds = %._crit_edge89
  %15 = add i64 %5, 15992
  %16 = bitcast double* %scevgep147 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %16, i8 0, i64 %15, i32 8, i1 false)
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.loopexit, %._crit_edge89
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %17, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next135, 2000
  br i1 %exitcond137, label %._crit_edge95, label %.preheader73

._crit_edge95:                                    ; preds = %._crit_edge93
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %.preheader72.lr.ph, label %._crit_edge76

.preheader72.lr.ph:                               ; preds = %._crit_edge95
  br i1 true, label %.preheader72.prol.loopexit, label %._crit_edge85.prol.preheader

._crit_edge85.prol.preheader:                     ; preds = %.preheader72.lr.ph
  br label %._crit_edge85.prol

._crit_edge85.prol:                               ; preds = %._crit_edge85.prol.preheader, %._crit_edge85.prol
  br i1 true, label %.preheader72.prol.loopexit.loopexit, label %._crit_edge85.prol, !llvm.loop !1

.preheader72.prol.loopexit.loopexit:              ; preds = %._crit_edge85.prol
  br label %.preheader72.prol.loopexit

.preheader72.prol.loopexit:                       ; preds = %.preheader72.prol.loopexit.loopexit, %.preheader72.lr.ph
  br i1 false, label %.preheader71, label %._crit_edge85.3.preheader

._crit_edge85.3.preheader:                        ; preds = %.preheader72.prol.loopexit
  br i1 false, label %._crit_edge85.3.prol.preheader, label %._crit_edge85.3.prol.loopexit

._crit_edge85.3.prol.preheader:                   ; preds = %._crit_edge85.3.preheader
  br label %._crit_edge85.3.prol

._crit_edge85.3.prol:                             ; preds = %._crit_edge85.3.prol.preheader
  br label %._crit_edge85.3.prol.loopexit

._crit_edge85.3.prol.loopexit:                    ; preds = %._crit_edge85.3.prol, %._crit_edge85.3.preheader
  %indvars.iv116.unr155 = phi i64 [ 0, %._crit_edge85.3.preheader ], [ 4, %._crit_edge85.3.prol ]
  br i1 false, label %.preheader71.loopexit, label %._crit_edge85.3.preheader.new

._crit_edge85.3.preheader.new:                    ; preds = %._crit_edge85.3.prol.loopexit
  br label %._crit_edge85.3

.preheader71.loopexit.unr-lcssa:                  ; preds = %._crit_edge85.3
  br label %.preheader71.loopexit

.preheader71.loopexit:                            ; preds = %._crit_edge85.3.prol.loopexit, %.preheader71.loopexit.unr-lcssa
  br label %.preheader71

.preheader71:                                     ; preds = %.preheader71.loopexit, %.preheader72.prol.loopexit
  br i1 true, label %.preheader70.lr.ph, label %._crit_edge76

.preheader70.lr.ph:                               ; preds = %.preheader71
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader70

.preheader70:                                     ; preds = %._crit_edge81, %.preheader70.lr.ph
  %indvars.iv108 = phi i64 [ 0, %.preheader70.lr.ph ], [ %indvars.iv.next109, %._crit_edge81 ]
  br label %.preheader69

.preheader68:                                     ; preds = %._crit_edge81
  br i1 true, label %.preheader.lr.ph, label %._crit_edge76

.preheader.lr.ph:                                 ; preds = %.preheader68
  %20 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader69:                                     ; preds = %._crit_edge79, %.preheader70
  %indvars.iv104 = phi i64 [ 0, %.preheader70 ], [ %indvars.iv.next105, %._crit_edge79 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 true, label %.prol.loopexit141, label %.prol.preheader140

.prol.preheader140:                               ; preds = %.preheader69
  br label %.prol.loopexit141

.prol.loopexit141:                                ; preds = %.prol.preheader140, %.preheader69
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader140 ], [ 0, %.preheader69 ]
  br i1 false, label %._crit_edge79, label %.preheader69.new.preheader

.preheader69.new.preheader:                       ; preds = %.prol.loopexit141
  br label %.preheader69.new

.preheader69.new:                                 ; preds = %.preheader69.new.preheader, %.preheader69.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.preheader69.new ], [ %indvars.iv100.unr.ph, %.preheader69.new.preheader ]
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv108
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv104, i64 %indvars.iv100
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %29 = load double, double* %21, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next101, i64 %indvars.iv108
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next101
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 2000
  br i1 %exitcond103.1, label %._crit_edge79.loopexit, label %.preheader69.new

._crit_edge79.loopexit:                           ; preds = %.preheader69.new
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge79.loopexit, %.prol.loopexit141
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge81, label %.preheader69

._crit_edge81:                                    ; preds = %._crit_edge79
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %.preheader68, label %.preheader70

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv96 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next97, %._crit_edge ]
  br i1 true, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  br i1 true, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader
  br i1 false, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.new ], [ 0, %.preheader.new.preheader ]
  %36 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv96, i64 %indvars.iv
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %52 = bitcast double* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next97, 2000
  br i1 %exitcond99, label %._crit_edge76.loopexit, label %.preheader

._crit_edge76.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %._crit_edge95.thread, %.preheader71, %._crit_edge95, %.preheader68
  %56 = phi i8* [ undef, %._crit_edge95.thread ], [ %18, %.preheader71 ], [ %18, %._crit_edge95 ], [ %18, %.preheader68 ], [ %18, %._crit_edge76.loopexit ]
  tail call void @free(i8* %56) #3
  ret void

._crit_edge85.3:                                  ; preds = %._crit_edge85.3, %._crit_edge85.3.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr155, %._crit_edge85.3.preheader.new ], [ %indvars.iv.next117.3.1, %._crit_edge85.3 ]
  %57 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul i64 %indvars.iv116, 16000
  %59 = add i64 %58, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul i64 %indvars.iv116, 16000
  %61 = add i64 %60, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %62 = mul i64 %indvars.iv116, 16000
  %63 = add i64 %62, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = add nsw i64 %indvars.iv116, 4
  %64 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1156 = getelementptr i8, i8* %18, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1156, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul i64 %indvars.iv.next117.3, 16000
  %66 = add i64 %65, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = mul i64 %indvars.iv.next117.3, 16000
  %68 = add i64 %67, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %69 = mul i64 %indvars.iv.next117.3, 16000
  %70 = add i64 %69, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %.preheader71.loopexit.unr-lcssa, label %._crit_edge85.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader44.lr.ph, label %._crit_edge51

.preheader44.lr.ph:                               ; preds = %2
  br label %.preheader44

.preheader44:                                     ; preds = %.preheader43._crit_edge, %.preheader44.lr.ph
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %.preheader43._crit_edge ], [ 0, %.preheader44.lr.ph ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %.preheader43._crit_edge ], [ 0, %.preheader44.lr.ph ]
  %3 = and i64 %indvars.iv92, 3
  %4 = add nsw i64 %indvars.iv65, -1
  %5 = icmp sgt i64 %indvars.iv65, 0
  br i1 %5, label %.preheader.preheader, label %.preheader43.thread

.preheader.preheader:                             ; preds = %.preheader44
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 0
  br label %.preheader

.preheader43.thread:                              ; preds = %.preheader44
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %.pre7079 = load double, double* %7, align 8
  br label %.preheader43._crit_edge

.preheader43:                                     ; preds = %.preheader._crit_edge
  %8 = icmp sgt i64 %indvars.iv65, 0
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %.pre70 = load double, double* %9, align 8
  br i1 %8, label %.lr.ph48.preheader, label %.preheader43._crit_edge

.lr.ph48.preheader:                               ; preds = %.preheader43
  %xtraiter76 = and i64 %indvars.iv65, 3
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.lr.ph48.prol.loopexit, label %.lr.ph48.prol.preheader

.lr.ph48.prol.preheader:                          ; preds = %.lr.ph48.preheader
  br label %.lr.ph48.prol

.lr.ph48.prol:                                    ; preds = %.lr.ph48.prol.preheader, %.lr.ph48.prol
  %10 = phi double [ %14, %.lr.ph48.prol ], [ %.pre70, %.lr.ph48.prol.preheader ]
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %.lr.ph48.prol ], [ 0, %.lr.ph48.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph48.prol ], [ %xtraiter76, %.lr.ph48.prol.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv60.prol
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fsub double %10, %13
  store double %14, double* %9, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph48.prol.loopexit.loopexit, label %.lr.ph48.prol, !llvm.loop !4

.lr.ph48.prol.loopexit.loopexit:                  ; preds = %.lr.ph48.prol
  br label %.lr.ph48.prol.loopexit

.lr.ph48.prol.loopexit:                           ; preds = %.lr.ph48.prol.loopexit.loopexit, %.lr.ph48.preheader
  %.lcssa75.unr = phi double [ undef, %.lr.ph48.preheader ], [ %14, %.lr.ph48.prol.loopexit.loopexit ]
  %.unr78 = phi double [ %.pre70, %.lr.ph48.preheader ], [ %14, %.lr.ph48.prol.loopexit.loopexit ]
  %indvars.iv60.unr = phi i64 [ 0, %.lr.ph48.preheader ], [ %3, %.lr.ph48.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %4, 3
  br i1 %15, label %.preheader43._crit_edge, label %.lr.ph48.preheader89

.lr.ph48.preheader89:                             ; preds = %.lr.ph48.prol.loopexit
  br label %.lr.ph48

.preheader:                                       ; preds = %.preheader.preheader, %.preheader._crit_edge
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.preheader._crit_edge ], [ 0, %.preheader.preheader ]
  %16 = icmp sgt i64 %indvars.iv54, 0
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv54
  %.pre = load double, double* %17, align 8
  br i1 %16, label %.lr.ph.preheader, label %.preheader._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv54, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %18 = load double, double* %6, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 0
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %.pre, %21
  store double %22, double* %17, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %.lcssa.unr.ph = phi double [ %22, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %22, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %23 = icmp eq i64 %indvars.iv54, 1
  br i1 %23, label %.preheader._crit_edge, label %.lr.ph.preheader88

.lr.ph.preheader88:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader88, %.lr.ph
  %24 = phi double [ %36, %.lr.ph ], [ %.unr.ph, %.lr.ph.preheader88 ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader88 ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %30, %35
  store double %36, double* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv54
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.lr.ph

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %37 = phi double [ %.pre, %.preheader ], [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %36, %.preheader._crit_edge.loopexit ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv54
  %39 = load double, double* %38, align 8
  %40 = fdiv double %37, %39
  store double %40, double* %17, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %indvars.iv65
  br i1 %exitcond59, label %.preheader43, label %.preheader

.lr.ph48:                                         ; preds = %.lr.ph48.preheader89, %.lr.ph48
  %41 = phi double [ %57, %.lr.ph48 ], [ %.unr78, %.lr.ph48.preheader89 ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.3, %.lr.ph48 ], [ %indvars.iv60.unr, %.lr.ph48.preheader89 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv60
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %9, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %9, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %9, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %9, align 8
  %indvars.iv.next61.3 = add nuw nsw i64 %indvars.iv60, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next61.3, %indvars.iv65
  br i1 %exitcond64.3, label %.preheader43._crit_edge.loopexit, label %.lr.ph48

.preheader43._crit_edge.loopexit:                 ; preds = %.lr.ph48
  br label %.preheader43._crit_edge

.preheader43._crit_edge:                          ; preds = %.preheader43._crit_edge.loopexit, %.lr.ph48.prol.loopexit, %.preheader43.thread, %.preheader43
  %58 = phi double* [ %9, %.preheader43 ], [ %7, %.preheader43.thread ], [ %9, %.lr.ph48.prol.loopexit ], [ %9, %.preheader43._crit_edge.loopexit ]
  %59 = phi double [ %.pre70, %.preheader43 ], [ %.pre7079, %.preheader43.thread ], [ %.lcssa75.unr, %.lr.ph48.prol.loopexit ], [ %57, %.preheader43._crit_edge.loopexit ]
  %60 = tail call double @sqrt(double %59) #3
  store double %60, double* %58, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 2000
  %indvars.iv.next93 = add nuw nsw i64 %3, 1
  br i1 %exitcond68, label %._crit_edge51.loopexit, label %.preheader44

._crit_edge51.loopexit:                           ; preds = %.preheader43._crit_edge
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge15

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge ], [ 1, %.lr.ph.preheader ]
  %7 = mul i64 %indvars.iv18, 2000
  br label %8

; <label>:8:                                      ; preds = %.lr.ph, %15
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %9 = add i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %15
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond20, label %._crit_edge15.loopexit, label %.lr.ph

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
