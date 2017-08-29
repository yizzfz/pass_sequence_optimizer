; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %6 = sitofp i32 %0 to double
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph99.preheader, label %._crit_edge96.thread

.lr.ph99.preheader:                               ; preds = %5
  %xtraiter120 = and i64 %7, 1
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.lr.ph99.prol.loopexit, label %.lr.ph99.prol

.lr.ph99.prol:                                    ; preds = %.lr.ph99.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %9 = fdiv double 1.000000e+00, %6
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  store double %11, double* %2, align 8
  br label %.lr.ph99.prol.loopexit

.lr.ph99.prol.loopexit:                           ; preds = %.lr.ph99.preheader, %.lr.ph99.prol
  %indvars.iv4397.unr = phi i64 [ 1, %.lr.ph99.prol ], [ 0, %.lr.ph99.preheader ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %.preheader51.preheader, label %.lr.ph99.preheader132

.lr.ph99.preheader132:                            ; preds = %.lr.ph99.prol.loopexit
  %13 = insertelement <2 x double> undef, double %6, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph99

.preheader52:                                     ; preds = %.lr.ph99
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.preheader51.preheader, label %._crit_edge96.thread

.preheader51.preheader:                           ; preds = %.lr.ph99.prol.loopexit, %.preheader52
  %16 = shl nsw i64 %7, 3
  %17 = add nsw i64 %16, -8
  br label %.preheader51

.lr.ph99:                                         ; preds = %.lr.ph99.preheader132, %.lr.ph99
  %indvars.iv4397 = phi i64 [ %indvars.iv.next44.1, %.lr.ph99 ], [ %indvars.iv4397.unr, %.lr.ph99.preheader132 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv4397
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv4397
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4397, 1
  %22 = trunc i64 %indvars.iv.next44 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv4397
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv4397, 2
  %25 = trunc i64 %indvars.iv.next44.1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, %14
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next44.1, %7
  br i1 %exitcond112.1, label %.preheader52, label %.lr.ph99

.preheader51:                                     ; preds = %._crit_edge91, %.preheader51.preheader
  %indvars.iv = phi i64 [ 1, %.preheader51.preheader ], [ %indvars.iv.next110, %._crit_edge91 ]
  %indvars.iv4192 = phi i64 [ 0, %.preheader51.preheader ], [ %indvars.iv.next42, %._crit_edge91 ]
  %33 = mul nuw nsw i64 %indvars.iv4192, 2001
  %34 = add nuw nsw i64 %33, 1
  %scevgep108 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %34
  %scevgep108109 = bitcast double* %scevgep108 to i8*
  %35 = mul nsw i64 %indvars.iv4192, -8
  %36 = add nsw i64 %17, %35
  br label %._crit_edge122

.preheader50:                                     ; preds = %._crit_edge122
  %exitcond3888 = icmp eq i64 %indvars.iv, %7
  br i1 %exitcond3888, label %._crit_edge91, label %._crit_edge91.loopexit

._crit_edge122:                                   ; preds = %._crit_edge122, %.preheader51
  %indvars.iv2787 = phi i64 [ 0, %.preheader51 ], [ %indvars.iv.next28, %._crit_edge122 ]
  %37 = sub nsw i64 0, %indvars.iv2787
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %0
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %6
  %42 = fadd double %41, 1.000000e+00
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4192, i64 %indvars.iv2787
  store double %42, double* %43, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2787, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next28, %indvars.iv
  br i1 %exitcond32, label %.preheader50, label %._crit_edge122

._crit_edge91.loopexit:                           ; preds = %.preheader50
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep108109, i8 0, i64 %36, i32 8, i1 false)
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %.preheader50, %._crit_edge91.loopexit
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4192, i64 %indvars.iv4192
  store double 1.000000e+00, double* %44, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv4192, 1
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next42, %7
  br i1 %exitcond111, label %._crit_edge96, label %.preheader51

._crit_edge96.thread:                             ; preds = %.preheader52, %5
  %45 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge57

._crit_edge96:                                    ; preds = %._crit_edge91
  %46 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %47 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %48 = icmp sgt i32 %0, 0
  br i1 %48, label %.preheader49.preheader, label %._crit_edge57

.preheader49.preheader:                           ; preds = %._crit_edge96
  %wide.trip.count23 = zext i32 %0 to i64
  %49 = shl nuw nsw i64 %wide.trip.count23, 3
  %50 = add nsw i64 %7, -1
  %xtraiter117 = and i64 %7, 3
  %lcmp.mod118 = icmp eq i64 %xtraiter117, 0
  br i1 %lcmp.mod118, label %.preheader49.prol.loopexit, label %._crit_edge84.prol.preheader

._crit_edge84.prol.preheader:                     ; preds = %.preheader49.preheader
  br label %._crit_edge84.prol

._crit_edge84.prol:                               ; preds = %._crit_edge84.prol.preheader, %._crit_edge84.prol
  %indvars.iv2585.prol = phi i64 [ %indvars.iv.next26.prol, %._crit_edge84.prol ], [ 0, %._crit_edge84.prol.preheader ]
  %prol.iter119 = phi i64 [ %prol.iter119.sub, %._crit_edge84.prol ], [ %xtraiter117, %._crit_edge84.prol.preheader ]
  %51 = mul nuw nsw i64 %indvars.iv2585.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %46, i64 %51
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %49, i32 8, i1 false)
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv2585.prol, 1
  %prol.iter119.sub = add i64 %prol.iter119, -1
  %prol.iter119.cmp = icmp eq i64 %prol.iter119.sub, 0
  br i1 %prol.iter119.cmp, label %.preheader49.prol.loopexit.loopexit, label %._crit_edge84.prol, !llvm.loop !1

.preheader49.prol.loopexit.loopexit:              ; preds = %._crit_edge84.prol
  br label %.preheader49.prol.loopexit

.preheader49.prol.loopexit:                       ; preds = %.preheader49.prol.loopexit.loopexit, %.preheader49.preheader
  %indvars.iv2585.unr = phi i64 [ 0, %.preheader49.preheader ], [ %indvars.iv.next26.prol, %.preheader49.prol.loopexit.loopexit ]
  %52 = icmp ult i64 %50, 3
  br i1 %52, label %.preheader48, label %._crit_edge84.3.preheader

._crit_edge84.3.preheader:                        ; preds = %.preheader49.prol.loopexit
  %53 = add nsw i64 %7, -4
  %54 = sub i64 %53, %indvars.iv2585.unr
  %55 = lshr i64 %54, 2
  %56 = and i64 %55, 1
  %lcmp.mod134 = icmp eq i64 %56, 0
  br i1 %lcmp.mod134, label %._crit_edge84.3.prol.preheader, label %._crit_edge84.3.prol.loopexit

._crit_edge84.3.prol.preheader:                   ; preds = %._crit_edge84.3.preheader
  br label %._crit_edge84.3.prol

._crit_edge84.3.prol:                             ; preds = %._crit_edge84.3.prol.preheader
  %57 = mul nuw nsw i64 %indvars.iv2585.unr, 16000
  %scevgep.prol136 = getelementptr i8, i8* %46, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol136, i8 0, i64 %49, i32 8, i1 false)
  %58 = mul i64 %indvars.iv2585.unr, 16000
  %59 = add i64 %58, 16000
  %scevgep.1.prol = getelementptr i8, i8* %46, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %49, i32 8, i1 false)
  %60 = mul i64 %indvars.iv2585.unr, 16000
  %61 = add i64 %60, 32000
  %scevgep.2.prol = getelementptr i8, i8* %46, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %49, i32 8, i1 false)
  %62 = mul i64 %indvars.iv2585.unr, 16000
  %63 = add i64 %62, 48000
  %scevgep.3.prol = getelementptr i8, i8* %46, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %49, i32 8, i1 false)
  %indvars.iv.next26.3.prol = add nsw i64 %indvars.iv2585.unr, 4
  br label %._crit_edge84.3.prol.loopexit

._crit_edge84.3.prol.loopexit:                    ; preds = %._crit_edge84.3.prol, %._crit_edge84.3.preheader
  %indvars.iv2585.unr137 = phi i64 [ %indvars.iv2585.unr, %._crit_edge84.3.preheader ], [ %indvars.iv.next26.3.prol, %._crit_edge84.3.prol ]
  %64 = icmp eq i64 %55, 0
  br i1 %64, label %.preheader48.loopexit, label %._crit_edge84.3.preheader.new

._crit_edge84.3.preheader.new:                    ; preds = %._crit_edge84.3.prol.loopexit
  br label %._crit_edge84.3

.preheader48.loopexit.unr-lcssa:                  ; preds = %._crit_edge84.3
  br label %.preheader48.loopexit

.preheader48.loopexit:                            ; preds = %._crit_edge84.3.prol.loopexit, %.preheader48.loopexit.unr-lcssa
  br label %.preheader48

.preheader48:                                     ; preds = %.preheader48.loopexit, %.preheader49.prol.loopexit
  %65 = icmp sgt i32 %0, 0
  br i1 %65, label %.preheader47.preheader, label %._crit_edge57

.preheader47.preheader:                           ; preds = %.preheader48
  %wide.trip.count17 = zext i32 %0 to i64
  %xtraiter115 = and i64 %wide.trip.count17, 1
  %lcmp.mod116 = icmp eq i64 %xtraiter115, 0
  %66 = icmp eq i32 %0, 1
  br label %.preheader46.preheader

.preheader46.preheader:                           ; preds = %._crit_edge65, %.preheader47.preheader
  %indvars.iv1966 = phi i64 [ 0, %.preheader47.preheader ], [ %indvars.iv.next20, %._crit_edge65 ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv1966
  br label %.preheader46

.preheader45:                                     ; preds = %._crit_edge65
  %68 = icmp sgt i32 %0, 0
  br i1 %68, label %.preheader.preheader, label %._crit_edge57

.preheader.preheader:                             ; preds = %.preheader45
  %wide.trip.count = zext i32 %0 to i64
  %69 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %70 = icmp ult i64 %69, 3
  br label %.preheader

.preheader46:                                     ; preds = %._crit_edge61, %.preheader46.preheader
  %indvars.iv1563 = phi i64 [ 0, %.preheader46.preheader ], [ %indvars.iv.next16, %._crit_edge61 ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1563, i64 %indvars.iv1966
  br i1 %lcmp.mod116, label %.prol.loopexit114, label %.prol.preheader113

.prol.preheader113:                               ; preds = %.preheader46
  %72 = load double, double* %71, align 8
  %73 = load double, double* %67, align 8
  %74 = fmul double %72, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv1563, i64 0
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  br label %.prol.loopexit114

.prol.loopexit114:                                ; preds = %.prol.preheader113, %.preheader46
  %indvars.iv1159.unr.ph = phi i64 [ 1, %.prol.preheader113 ], [ 0, %.preheader46 ]
  br i1 %66, label %._crit_edge61, label %.preheader46.new.preheader

.preheader46.new.preheader:                       ; preds = %.prol.loopexit114
  br label %.preheader46.new

.preheader46.new:                                 ; preds = %.preheader46.new.preheader, %.preheader46.new
  %indvars.iv1159 = phi i64 [ %indvars.iv.next12.1, %.preheader46.new ], [ %indvars.iv1159.unr.ph, %.preheader46.new.preheader ]
  %78 = load double, double* %71, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1159, i64 %indvars.iv1966
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv1563, i64 %indvars.iv1159
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1159, 1
  %85 = load double, double* %71, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next12, i64 %indvars.iv1966
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv1563, i64 %indvars.iv.next12
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1159, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next12.1, %wide.trip.count17
  br i1 %exitcond14.1, label %._crit_edge61.loopexit, label %.preheader46.new

._crit_edge61.loopexit:                           ; preds = %.preheader46.new
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %.prol.loopexit114
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1563, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge65, label %.preheader46

._crit_edge65:                                    ; preds = %._crit_edge61
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1966, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next20, %7
  br i1 %exitcond106, label %.preheader45, label %.preheader46.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv955 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv955, i64 %indvars.iv54.prol
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv955, i64 %indvars.iv54.prol
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader
  %indvars.iv54.unr = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %70, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next.3, %.preheader.new ], [ %indvars.iv54.unr, %.preheader.new.preheader ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv955, i64 %indvars.iv54
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv955, i64 %indvars.iv54
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv54, 1
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv955, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv955, i64 %indvars.iv.next
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv54, 2
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv955, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv955, i64 %indvars.iv.next.1
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv54, 3
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv955, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv955, i64 %indvars.iv.next.2
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv54, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv955, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next10, %7
  br i1 %exitcond105, label %._crit_edge57.loopexit, label %.preheader

._crit_edge57.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.loopexit, %._crit_edge96.thread, %._crit_edge96, %.preheader48, %.preheader45
  %117 = phi i8* [ %46, %.preheader45 ], [ %46, %.preheader48 ], [ %46, %._crit_edge96 ], [ %45, %._crit_edge96.thread ], [ %46, %._crit_edge57.loopexit ]
  tail call void @free(i8* %117) #4
  ret void

._crit_edge84.3:                                  ; preds = %._crit_edge84.3, %._crit_edge84.3.preheader.new
  %indvars.iv2585 = phi i64 [ %indvars.iv2585.unr137, %._crit_edge84.3.preheader.new ], [ %indvars.iv.next26.3.1, %._crit_edge84.3 ]
  %118 = mul nuw nsw i64 %indvars.iv2585, 16000
  %scevgep = getelementptr i8, i8* %46, i64 %118
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %49, i32 8, i1 false)
  %119 = mul i64 %indvars.iv2585, 16000
  %120 = add i64 %119, 16000
  %scevgep.1 = getelementptr i8, i8* %46, i64 %120
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %49, i32 8, i1 false)
  %121 = mul i64 %indvars.iv2585, 16000
  %122 = add i64 %121, 32000
  %scevgep.2 = getelementptr i8, i8* %46, i64 %122
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %49, i32 8, i1 false)
  %123 = mul i64 %indvars.iv2585, 16000
  %124 = add i64 %123, 48000
  %scevgep.3 = getelementptr i8, i8* %46, i64 %124
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %49, i32 8, i1 false)
  %indvars.iv.next26.3 = add nsw i64 %indvars.iv2585, 4
  %125 = mul nuw nsw i64 %indvars.iv.next26.3, 16000
  %scevgep.1138 = getelementptr i8, i8* %46, i64 %125
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1138, i8 0, i64 %49, i32 8, i1 false)
  %126 = mul i64 %indvars.iv.next26.3, 16000
  %127 = add i64 %126, 16000
  %scevgep.1.1 = getelementptr i8, i8* %46, i64 %127
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %49, i32 8, i1 false)
  %128 = mul i64 %indvars.iv.next26.3, 16000
  %129 = add i64 %128, 32000
  %scevgep.2.1 = getelementptr i8, i8* %46, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %49, i32 8, i1 false)
  %130 = mul i64 %indvars.iv.next26.3, 16000
  %131 = add i64 %130, 48000
  %scevgep.3.1 = getelementptr i8, i8* %46, i64 %131
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %49, i32 8, i1 false)
  %indvars.iv.next26.3.1 = add nsw i64 %indvars.iv2585, 8
  %exitcond107.3.1 = icmp eq i64 %indvars.iv.next26.3.1, %7
  br i1 %exitcond107.3.1, label %.preheader48.loopexit.unr-lcssa, label %._crit_edge84.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = sext i32 %0 to i64
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader45.lr.ph, label %._crit_edge53

.preheader45.lr.ph:                               ; preds = %5
  %wide.trip.count40 = zext i32 %0 to i64
  br label %.preheader45

.preheader45:                                     ; preds = %._crit_edge86, %.preheader45.lr.ph
  %indvars.iv4287 = phi i64 [ 0, %.preheader45.lr.ph ], [ %indvars.iv.next43, %._crit_edge86 ]
  %exitcond3072 = icmp eq i64 %indvars.iv4287, 0
  br i1 %exitcond3072, label %.preheader44, label %.lr.ph74.preheader

.lr.ph74.preheader:                               ; preds = %.preheader45
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4287, i64 0
  br label %.lr.ph74

.preheader:                                       ; preds = %._crit_edge86
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph63.preheader, label %._crit_edge53

.lr.ph63.preheader:                               ; preds = %.preheader
  br label %.lr.ph63

.preheader44.loopexit:                            ; preds = %._crit_edge70
  br label %.preheader44

.preheader44:                                     ; preds = %.preheader44.loopexit, %.preheader45
  %exitcond4182 = icmp eq i64 %indvars.iv4287, %wide.trip.count40
  %exitcond3575 = icmp eq i64 %indvars.iv4287, 0
  %or.cond = or i1 %exitcond4182, %exitcond3575
  br i1 %or.cond, label %._crit_edge86, label %.lr.ph85.split.preheader

.lr.ph85.split.preheader:                         ; preds = %.preheader44
  %xtraiter102 = and i64 %indvars.iv4287, 1
  %lcmp.mod103 = icmp eq i64 %xtraiter102, 0
  %10 = icmp eq i64 %indvars.iv4287, 1
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4287, i64 0
  br label %.lr.ph85.split

.lr.ph74:                                         ; preds = %.lr.ph74.preheader, %._crit_edge70
  %indvars.iv2573 = phi i64 [ %indvars.iv.next26, %._crit_edge70 ], [ 0, %.lr.ph74.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4287, i64 %indvars.iv2573
  %13 = load double, double* %12, align 8
  %exitcond2465 = icmp eq i64 %indvars.iv2573, 0
  br i1 %exitcond2465, label %._crit_edge70, label %.lr.ph69.preheader

.lr.ph69.preheader:                               ; preds = %.lr.ph74
  %xtraiter100 = and i64 %indvars.iv2573, 1
  %lcmp.mod101 = icmp eq i64 %xtraiter100, 0
  br i1 %lcmp.mod101, label %.lr.ph69.prol.loopexit, label %.lr.ph69.prol

.lr.ph69.prol:                                    ; preds = %.lr.ph69.preheader
  %14 = load double, double* %8, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2573
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %13, %17
  br label %.lr.ph69.prol.loopexit

.lr.ph69.prol.loopexit:                           ; preds = %.lr.ph69.prol, %.lr.ph69.preheader
  %.lcssa92.unr.ph = phi double [ %18, %.lr.ph69.prol ], [ undef, %.lr.ph69.preheader ]
  %.067.unr.ph = phi double [ %18, %.lr.ph69.prol ], [ %13, %.lr.ph69.preheader ]
  %indvars.iv2066.unr.ph = phi i64 [ 1, %.lr.ph69.prol ], [ 0, %.lr.ph69.preheader ]
  %19 = icmp eq i64 %indvars.iv2573, 1
  br i1 %19, label %._crit_edge70, label %.lr.ph69.preheader123

.lr.ph69.preheader123:                            ; preds = %.lr.ph69.prol.loopexit
  br label %.lr.ph69

.lr.ph69:                                         ; preds = %.lr.ph69.preheader123, %.lr.ph69
  %.067 = phi double [ %33, %.lr.ph69 ], [ %.067.unr.ph, %.lr.ph69.preheader123 ]
  %indvars.iv2066 = phi i64 [ %indvars.iv.next21.1, %.lr.ph69 ], [ %indvars.iv2066.unr.ph, %.lr.ph69.preheader123 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4287, i64 %indvars.iv2066
  %21 = bitcast double* %20 to <2 x double>*
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2066, i64 %indvars.iv2573
  %23 = load double, double* %22, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2066, 1
  %24 = load <2 x double>, <2 x double>* %21, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next21, i64 %indvars.iv2573
  %26 = load double, double* %25, align 8
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %24, %28
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %.067, %30
  %33 = fsub double %32, %31
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv2066, 2
  %exitcond24.1 = icmp eq i64 %indvars.iv.next21.1, %indvars.iv2573
  br i1 %exitcond24.1, label %._crit_edge70.loopexit, label %.lr.ph69

._crit_edge70.loopexit:                           ; preds = %.lr.ph69
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %.lr.ph69.prol.loopexit, %.lr.ph74
  %.0.lcssa = phi double [ %13, %.lr.ph74 ], [ %.lcssa92.unr.ph, %.lr.ph69.prol.loopexit ], [ %33, %._crit_edge70.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2573, i64 %indvars.iv2573
  %35 = load double, double* %34, align 8
  %36 = fdiv double %.0.lcssa, %35
  store double %36, double* %12, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2573, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, %indvars.iv4287
  br i1 %exitcond30, label %.preheader44.loopexit, label %.lr.ph74

.lr.ph85.split:                                   ; preds = %.lr.ph85.split.preheader, %._crit_edge80
  %indvars.iv3883 = phi i64 [ %indvars.iv.next39, %._crit_edge80 ], [ %indvars.iv4287, %.lr.ph85.split.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4287, i64 %indvars.iv3883
  %38 = load double, double* %37, align 8
  br i1 %lcmp.mod103, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph85.split
  %39 = load double, double* %11, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv3883
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %38, %42
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph85.split
  %.lcssa93.unr.ph = phi double [ %43, %.prol.preheader ], [ undef, %.lr.ph85.split ]
  %.177.unr.ph = phi double [ %43, %.prol.preheader ], [ %38, %.lr.ph85.split ]
  %indvars.iv3176.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph85.split ]
  br i1 %10, label %._crit_edge80, label %.lr.ph85.split.new.preheader

.lr.ph85.split.new.preheader:                     ; preds = %.prol.loopexit
  br label %.lr.ph85.split.new

.lr.ph85.split.new:                               ; preds = %.lr.ph85.split.new.preheader, %.lr.ph85.split.new
  %.177 = phi double [ %57, %.lr.ph85.split.new ], [ %.177.unr.ph, %.lr.ph85.split.new.preheader ]
  %indvars.iv3176 = phi i64 [ %indvars.iv.next32.1, %.lr.ph85.split.new ], [ %indvars.iv3176.unr.ph, %.lr.ph85.split.new.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4287, i64 %indvars.iv3176
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3176, i64 %indvars.iv3883
  %47 = load double, double* %46, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv3176, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next32, i64 %indvars.iv3883
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.177, %54
  %57 = fsub double %56, %55
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv3176, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next32.1, %indvars.iv4287
  br i1 %exitcond35.1, label %._crit_edge80.loopexit, label %.lr.ph85.split.new

._crit_edge80.loopexit:                           ; preds = %.lr.ph85.split.new
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %.prol.loopexit
  %.lcssa93 = phi double [ %.lcssa93.unr.ph, %.prol.loopexit ], [ %57, %._crit_edge80.loopexit ]
  store double %.lcssa93, double* %37, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3883, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge86.loopexit, label %.lr.ph85.split

._crit_edge86.loopexit:                           ; preds = %._crit_edge80
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %._crit_edge86.loopexit, %.preheader44
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4287, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next43, %6
  br i1 %exitcond96, label %.preheader, label %.preheader45

.lr.ph63:                                         ; preds = %.lr.ph63.preheader, %._crit_edge59
  %indvars.iv1861 = phi i64 [ %indvars.iv.next19, %._crit_edge59 ], [ 0, %.lr.ph63.preheader ]
  %58 = add i64 %indvars.iv1861, -1
  %59 = getelementptr inbounds double, double* %2, i64 %indvars.iv1861
  %60 = load double, double* %59, align 8
  %exitcond54 = icmp eq i64 %indvars.iv1861, 0
  br i1 %exitcond54, label %._crit_edge59, label %.lr.ph58.preheader

.lr.ph58.preheader:                               ; preds = %.lr.ph63
  %xtraiter97 = and i64 %indvars.iv1861, 3
  %lcmp.mod98 = icmp eq i64 %xtraiter97, 0
  br i1 %lcmp.mod98, label %.lr.ph58.prol.loopexit, label %.lr.ph58.prol.preheader

.lr.ph58.prol.preheader:                          ; preds = %.lr.ph58.preheader
  br label %.lr.ph58.prol

.lr.ph58.prol:                                    ; preds = %.lr.ph58.prol.preheader, %.lr.ph58.prol
  %.256.prol = phi double [ %66, %.lr.ph58.prol ], [ %60, %.lr.ph58.prol.preheader ]
  %indvars.iv1455.prol = phi i64 [ %indvars.iv.next15.prol, %.lr.ph58.prol ], [ 0, %.lr.ph58.prol.preheader ]
  %prol.iter99 = phi i64 [ %prol.iter99.sub, %.lr.ph58.prol ], [ %xtraiter97, %.lr.ph58.prol.preheader ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1861, i64 %indvars.iv1455.prol
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %4, i64 %indvars.iv1455.prol
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %.256.prol, %65
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv1455.prol, 1
  %prol.iter99.sub = add i64 %prol.iter99, -1
  %prol.iter99.cmp = icmp eq i64 %prol.iter99.sub, 0
  br i1 %prol.iter99.cmp, label %.lr.ph58.prol.loopexit.loopexit, label %.lr.ph58.prol, !llvm.loop !4

.lr.ph58.prol.loopexit.loopexit:                  ; preds = %.lr.ph58.prol
  br label %.lr.ph58.prol.loopexit

.lr.ph58.prol.loopexit:                           ; preds = %.lr.ph58.prol.loopexit.loopexit, %.lr.ph58.preheader
  %.lcssa91.unr = phi double [ undef, %.lr.ph58.preheader ], [ %66, %.lr.ph58.prol.loopexit.loopexit ]
  %.256.unr = phi double [ %60, %.lr.ph58.preheader ], [ %66, %.lr.ph58.prol.loopexit.loopexit ]
  %indvars.iv1455.unr = phi i64 [ 0, %.lr.ph58.preheader ], [ %indvars.iv.next15.prol, %.lr.ph58.prol.loopexit.loopexit ]
  %67 = icmp ult i64 %58, 3
  br i1 %67, label %._crit_edge59, label %.lr.ph58.preheader122

.lr.ph58.preheader122:                            ; preds = %.lr.ph58.prol.loopexit
  br label %.lr.ph58

.lr.ph58:                                         ; preds = %.lr.ph58.preheader122, %.lr.ph58
  %.256 = phi double [ %89, %.lr.ph58 ], [ %.256.unr, %.lr.ph58.preheader122 ]
  %indvars.iv1455 = phi i64 [ %indvars.iv.next15.3, %.lr.ph58 ], [ %indvars.iv1455.unr, %.lr.ph58.preheader122 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1861, i64 %indvars.iv1455
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds double, double* %4, i64 %indvars.iv1455
  %71 = bitcast double* %70 to <2 x double>*
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = load <2 x double>, <2 x double>* %71, align 8
  %74 = fmul <2 x double> %72, %73
  %75 = extractelement <2 x double> %74, i32 0
  %76 = extractelement <2 x double> %74, i32 1
  %77 = fsub double %.256, %75
  %78 = fsub double %77, %76
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv1455, 2
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1861, i64 %indvars.iv.next15.1
  %80 = bitcast double* %79 to <2 x double>*
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next15.1
  %82 = bitcast double* %81 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %80, align 8
  %84 = load <2 x double>, <2 x double>* %82, align 8
  %85 = fmul <2 x double> %83, %84
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %88 = fsub double %78, %86
  %89 = fsub double %88, %87
  %indvars.iv.next15.3 = add nsw i64 %indvars.iv1455, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next15.3, %indvars.iv1861
  br i1 %exitcond.3, label %._crit_edge59.loopexit, label %.lr.ph58

._crit_edge59.loopexit:                           ; preds = %.lr.ph58
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %.lr.ph58.prol.loopexit, %.lr.ph63
  %.2.lcssa = phi double [ %60, %.lr.ph63 ], [ %.lcssa91.unr, %.lr.ph58.prol.loopexit ], [ %89, %._crit_edge59.loopexit ]
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv1861
  store double %.2.lcssa, double* %90, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1861, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next19, %6
  br i1 %exitcond95, label %._crit_edge64, label %.lr.ph63

._crit_edge64:                                    ; preds = %._crit_edge59
  %91 = icmp sgt i32 %0, 0
  br i1 %91, label %.lr.ph52.preheader, label %._crit_edge53

.lr.ph52.preheader:                               ; preds = %._crit_edge64
  %92 = add nsw i32 %0, -1
  %93 = sext i32 %92 to i64
  %94 = add nsw i64 %6, -1
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %._crit_edge, %.lr.ph52.preheader
  %indvar = phi i32 [ 0, %.lr.ph52.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv50 = phi i32 [ %0, %.lr.ph52.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv1248 = phi i64 [ %93, %.lr.ph52.preheader ], [ %indvars.iv.next13, %._crit_edge ]
  %95 = sub i32 %0, %indvar
  %96 = sext i32 %95 to i64
  %97 = sub nsw i64 %94, %96
  %98 = sext i32 %indvars.iv50 to i64
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv1248
  %100 = load double, double* %99, align 8
  %101 = icmp slt i32 %indvars.iv50, %0
  br i1 %101, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph52
  %102 = sub nsw i64 %6, %96
  %xtraiter = and i64 %102, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.347.prol = phi double [ %108, %.lr.ph.prol ], [ %100, %.lr.ph.prol.preheader ]
  %indvars.iv1046.prol = phi i64 [ %indvars.iv.next11.prol, %.lr.ph.prol ], [ %98, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1248, i64 %indvars.iv1046.prol
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %3, i64 %indvars.iv1046.prol
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fsub double %.347.prol, %107
  %indvars.iv.next11.prol = add nsw i64 %indvars.iv1046.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.347.unr = phi double [ %100, %.lr.ph.preheader ], [ %108, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv1046.unr = phi i64 [ %98, %.lr.ph.preheader ], [ %indvars.iv.next11.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %108, %.lr.ph.prol.loopexit.loopexit ]
  %109 = icmp ult i64 %97, 3
  br i1 %109, label %._crit_edge, label %.lr.ph.preheader121

.lr.ph.preheader121:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader121, %.lr.ph
  %.347 = phi double [ %131, %.lr.ph ], [ %.347.unr, %.lr.ph.preheader121 ]
  %indvars.iv1046 = phi i64 [ %indvars.iv.next11.3, %.lr.ph ], [ %indvars.iv1046.unr, %.lr.ph.preheader121 ]
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1248, i64 %indvars.iv1046
  %111 = bitcast double* %110 to <2 x double>*
  %112 = getelementptr inbounds double, double* %3, i64 %indvars.iv1046
  %113 = bitcast double* %112 to <2 x double>*
  %114 = load <2 x double>, <2 x double>* %111, align 8
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %116 = fmul <2 x double> %114, %115
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fsub double %.347, %117
  %120 = fsub double %119, %118
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv1046, 2
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1248, i64 %indvars.iv.next11.1
  %122 = bitcast double* %121 to <2 x double>*
  %123 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.1
  %124 = bitcast double* %123 to <2 x double>*
  %125 = load <2 x double>, <2 x double>* %122, align 8
  %126 = load <2 x double>, <2 x double>* %124, align 8
  %127 = fmul <2 x double> %125, %126
  %128 = extractelement <2 x double> %127, i32 0
  %129 = extractelement <2 x double> %127, i32 1
  %130 = fsub double %120, %128
  %131 = fsub double %130, %129
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv1046, 4
  %exitcond94.3 = icmp eq i64 %indvars.iv.next11.3, %6
  br i1 %exitcond94.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph52
  %.3.lcssa = phi double [ %100, %.lr.ph52 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %131, %._crit_edge.loopexit ]
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1248, i64 %indvars.iv1248
  %133 = load double, double* %132, align 8
  %134 = fdiv double %.3.lcssa, %133
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv1248
  store double %134, double* %135, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv1248, -1
  %indvars.iv.next = add i32 %indvars.iv50, -1
  %136 = icmp sgt i64 %indvars.iv1248, 0
  %indvar.next = add i32 %indvar, 1
  br i1 %136, label %.lr.ph52, label %._crit_edge53.loopexit

._crit_edge53.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %5, %.preheader, %._crit_edge64
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv1 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.lr.ph._crit_edge

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
