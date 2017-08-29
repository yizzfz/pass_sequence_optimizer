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
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader73.lr.ph, label %._crit_edge102.thread

._crit_edge102.thread:                            ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge76

.preheader73.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count153 = zext i32 %0 to i64
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %._crit_edge100..lr.ph95_crit_edge, %.preheader73.lr.ph
  %indvars.iv151 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next152, %._crit_edge100..lr.ph95_crit_edge ]
  %indvars.iv149 = phi i64 [ 1, %.preheader73.lr.ph ], [ %indvars.iv.next150, %._crit_edge100..lr.ph95_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv151, 2001
  %10 = add nuw nsw i64 %9, 1
  %11 = sub i64 %7, %indvars.iv151
  %12 = shl i64 %11, 3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph95
  %indvars.iv135 = phi i64 [ 0, %.lr.ph95 ], [ %indvars.iv.next136, %._crit_edge ]
  %13 = sub nsw i64 0, %indvars.iv135
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %5
  %18 = fadd double %17, 1.000000e+00
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv135
  store double %18, double* %19, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next136, %indvars.iv149
  br i1 %exitcond140, label %._crit_edge96, label %._crit_edge

._crit_edge96:                                    ; preds = %._crit_edge
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %20 = icmp slt i64 %indvars.iv.next152, %8
  br i1 %20, label %._crit_edge100.loopexit, label %._crit_edge100

._crit_edge100.loopexit:                          ; preds = %._crit_edge96
  %21 = and i64 %12, 34359738360
  %22 = add nuw nsw i64 %21, 8
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep147148 = bitcast double* %scevgep147 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep147148, i8 0, i64 %22, i32 8, i1 false)
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge96, %._crit_edge100.loopexit
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %23, align 8
  %exitcond154 = icmp eq i64 %indvars.iv.next152, %wide.trip.count153
  br i1 %exitcond154, label %._crit_edge102, label %._crit_edge100..lr.ph95_crit_edge

._crit_edge100..lr.ph95_crit_edge:                ; preds = %._crit_edge100
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  br label %.lr.ph95

._crit_edge102:                                   ; preds = %._crit_edge100
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %25 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %xtraiter132 = and i32 %0, 3
  %lcmp.mod133 = icmp eq i32 %xtraiter132, 0
  br i1 %lcmp.mod133, label %.preheader72.us.prol.loopexit, label %._crit_edge92.us.prol.preheader

._crit_edge92.us.prol.preheader:                  ; preds = %._crit_edge102
  %30 = add nsw i32 %xtraiter132, -1
  br label %._crit_edge92.us.prol

._crit_edge92.us.prol:                            ; preds = %._crit_edge92.us.prol.._crit_edge92.us.prol_crit_edge, %._crit_edge92.us.prol.preheader
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %._crit_edge92.us.prol.._crit_edge92.us.prol_crit_edge ], [ 0, %._crit_edge92.us.prol.preheader ]
  %prol.iter134 = phi i32 [ %prol.iter134.sub, %._crit_edge92.us.prol.._crit_edge92.us.prol_crit_edge ], [ %xtraiter132, %._crit_edge92.us.prol.preheader ]
  %31 = mul nuw nsw i64 %indvars.iv128.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %prol.iter134.sub = add nsw i32 %prol.iter134, -1
  %prol.iter134.cmp = icmp eq i32 %prol.iter134.sub, 0
  br i1 %prol.iter134.cmp, label %.preheader72.us.prol.loopexit.loopexit, label %._crit_edge92.us.prol.._crit_edge92.us.prol_crit_edge, !llvm.loop !1

._crit_edge92.us.prol.._crit_edge92.us.prol_crit_edge: ; preds = %._crit_edge92.us.prol
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  br label %._crit_edge92.us.prol

.preheader72.us.prol.loopexit.loopexit:           ; preds = %._crit_edge92.us.prol
  %32 = zext i32 %30 to i64
  %33 = add nuw nsw i64 %32, 1
  br label %.preheader72.us.prol.loopexit

.preheader72.us.prol.loopexit:                    ; preds = %._crit_edge102, %.preheader72.us.prol.loopexit.loopexit
  %indvars.iv128.unr = phi i64 [ %33, %.preheader72.us.prol.loopexit.loopexit ], [ 0, %._crit_edge102 ]
  %34 = icmp ult i32 %26, 3
  br i1 %34, label %.preheader70.lr.ph, label %._crit_edge92.us.3.preheader

._crit_edge92.us.3.preheader:                     ; preds = %.preheader72.us.prol.loopexit
  %35 = add nsw i64 %wide.trip.count153, -4
  %36 = sub nsw i64 %35, %indvars.iv128.unr
  %37 = lshr i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %._crit_edge92.us.3.prol.preheader, label %._crit_edge92.us.3.prol.loopexit

._crit_edge92.us.3.prol.preheader:                ; preds = %._crit_edge92.us.3.preheader
  br label %._crit_edge92.us.3.prol

._crit_edge92.us.3.prol:                          ; preds = %._crit_edge92.us.3.prol.preheader
  %39 = mul nsw i64 %indvars.iv128.unr, 16000
  %scevgep.prol160 = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol160, i8 0, i64 %29, i32 8, i1 false)
  %40 = add i64 %39, 16000
  %scevgep.1.prol = getelementptr i8, i8* %24, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %29, i32 8, i1 false)
  %41 = add i64 %39, 32000
  %scevgep.2.prol = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %29, i32 8, i1 false)
  %42 = add i64 %39, 48000
  %scevgep.3.prol = getelementptr i8, i8* %24, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next129.3.prol = add nsw i64 %indvars.iv128.unr, 4
  br label %._crit_edge92.us.3.prol.loopexit

._crit_edge92.us.3.prol.loopexit:                 ; preds = %._crit_edge92.us.3.prol, %._crit_edge92.us.3.preheader
  %indvars.iv128.unr161 = phi i64 [ %indvars.iv128.unr, %._crit_edge92.us.3.preheader ], [ %indvars.iv.next129.3.prol, %._crit_edge92.us.3.prol ]
  %43 = icmp eq i64 %37, 0
  br i1 %43, label %.preheader70.lr.ph.loopexit, label %._crit_edge92.us.3.preheader.new

._crit_edge92.us.3.preheader.new:                 ; preds = %._crit_edge92.us.3.prol.loopexit
  br label %._crit_edge92.us.3

.preheader70.lr.ph.loopexit.unr-lcssa:            ; preds = %._crit_edge92.us.3
  br label %.preheader70.lr.ph.loopexit

.preheader70.lr.ph.loopexit:                      ; preds = %._crit_edge92.us.3.prol.loopexit, %.preheader70.lr.ph.loopexit.unr-lcssa
  br label %.preheader70.lr.ph

.preheader70.lr.ph:                               ; preds = %.preheader70.lr.ph.loopexit, %.preheader72.us.prol.loopexit
  %xtraiter114 = and i32 %0, 1
  %lcmp.mod115 = icmp eq i32 %xtraiter114, 0
  %44 = icmp eq i32 %0, 1
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %._crit_edge81.us, %.preheader70.lr.ph
  %indvars.iv120 = phi i64 [ 0, %.preheader70.lr.ph ], [ %indvars.iv.next121, %._crit_edge81.us ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv120
  br label %.preheader69.us.us

._crit_edge81.us:                                 ; preds = %._crit_edge79.us.us
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next121, %wide.trip.count153
  br i1 %exitcond123, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader69.us.us:                               ; preds = %._crit_edge79.us.us, %.preheader69.us.us.preheader
  %indvars.iv116 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next117, %._crit_edge79.us.us ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv116, i64 %indvars.iv120
  br i1 %lcmp.mod115, label %.prol.loopexit113, label %.prol.preheader112

.prol.preheader112:                               ; preds = %.preheader69.us.us
  %47 = load double, double* %46, align 8
  %48 = load double, double* %45, align 8
  %49 = fmul double %47, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv116, i64 0
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  br label %.prol.loopexit113

.prol.loopexit113:                                ; preds = %.preheader69.us.us, %.prol.preheader112
  %indvars.iv108.unr.ph = phi i64 [ 1, %.prol.preheader112 ], [ 0, %.preheader69.us.us ]
  br i1 %44, label %._crit_edge79.us.us, label %.preheader69.us.us.new.preheader

.preheader69.us.us.new.preheader:                 ; preds = %.prol.loopexit113
  br label %.preheader69.us.us.new

._crit_edge79.us.us.loopexit:                     ; preds = %.preheader69.us.us.new
  br label %._crit_edge79.us.us

._crit_edge79.us.us:                              ; preds = %._crit_edge79.us.us.loopexit, %.prol.loopexit113
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next117, %wide.trip.count153
  br i1 %exitcond119, label %._crit_edge81.us, label %.preheader69.us.us

.preheader69.us.us.new:                           ; preds = %.preheader69.us.us.new.preheader, %.preheader69.us.us.new
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.1, %.preheader69.us.us.new ], [ %indvars.iv108.unr.ph, %.preheader69.us.us.new.preheader ]
  %53 = load double, double* %46, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv120
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv116, i64 %indvars.iv108
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %60 = load double, double* %46, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv120
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv116, i64 %indvars.iv.next109
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next109.1 = add nuw nsw i64 %indvars.iv108, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next109.1, %wide.trip.count153
  br i1 %exitcond111.1, label %._crit_edge79.us.us.loopexit, label %.preheader69.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge81.us
  %67 = add nsw i32 %xtraiter132, -1
  %68 = zext i32 %67 to i64
  %69 = add nuw nsw i64 %68, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next106, %._crit_edge.us ]
  br i1 %lcmp.mod133, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter132, %.prol.preheader.preheader ]
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv105, i64 %indvars.iv.prol
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.prol
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %69, %.prol.loopexit.loopexit ]
  br i1 %34, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv105, i64 %indvars.iv
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count153
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond = icmp eq i64 %indvars.iv.next106, %wide.trip.count153
  br i1 %exitcond, label %._crit_edge76.loopexit, label %.preheader.us

._crit_edge76.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %._crit_edge102.thread
  %95 = phi i8* [ %4, %._crit_edge102.thread ], [ %24, %._crit_edge76.loopexit ]
  tail call void @free(i8* %95) #3
  ret void

._crit_edge92.us.3:                               ; preds = %._crit_edge92.us.3, %._crit_edge92.us.3.preheader.new
  %indvars.iv128 = phi i64 [ %indvars.iv128.unr161, %._crit_edge92.us.3.preheader.new ], [ %indvars.iv.next129.3.1, %._crit_edge92.us.3 ]
  %96 = mul i64 %indvars.iv128, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %96
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %97 = add i64 %96, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %97
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %98 = add i64 %96, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %99 = add i64 %96, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %100 = mul i64 %indvars.iv128, 16000
  %101 = add i64 %100, 64000
  %scevgep.1162 = getelementptr i8, i8* %24, i64 %101
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1162, i8 0, i64 %29, i32 8, i1 false)
  %102 = add i64 %100, 80000
  %scevgep.1.1 = getelementptr i8, i8* %24, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %29, i32 8, i1 false)
  %103 = add i64 %100, 96000
  %scevgep.2.1 = getelementptr i8, i8* %24, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %29, i32 8, i1 false)
  %104 = add i64 %100, 112000
  %scevgep.3.1 = getelementptr i8, i8* %24, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next129.3.1 = add nsw i64 %indvars.iv128, 8
  %exitcond131.3.1 = icmp eq i64 %indvars.iv.next129.3.1, %wide.trip.count153
  br i1 %exitcond131.3.1, label %.preheader70.lr.ph.loopexit.unr-lcssa, label %._crit_edge92.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader44.preheader, label %._crit_edge51

.preheader44.preheader:                           ; preds = %2
  %wide.trip.count74 = zext i32 %0 to i64
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge49, %.preheader44.preheader
  %indvars.iv72 = phi i64 [ 0, %.preheader44.preheader ], [ %indvars.iv.next73, %._crit_edge49 ]
  %4 = add i64 %indvars.iv72, -2
  %5 = add nuw i64 %indvars.iv72, 4294967295
  %6 = icmp sgt i64 %indvars.iv72, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge49

.preheader.preheader:                             ; preds = %.preheader44
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 0
  br label %.preheader

.lr.ph48:                                         ; preds = %._crit_edge
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  %xtraiter6876 = and i64 %indvars.iv72, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter6876, 0
  br i1 %lcmp.mod69, label %.prol.loopexit67, label %.prol.preheader66

.prol.preheader66:                                ; preds = %.lr.ph48
  %9 = load double, double* %7, align 8
  %10 = fmul double %9, %9
  %11 = load double, double* %8, align 8
  %12 = fsub double %11, %10
  store double %12, double* %8, align 8
  br label %.prol.loopexit67

.prol.loopexit67:                                 ; preds = %.lr.ph48, %.prol.preheader66
  %indvars.iv61.unr.ph = phi i64 [ 1, %.prol.preheader66 ], [ 0, %.lr.ph48 ]
  %13 = trunc i64 %5 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge49, label %.lr.ph48.new.preheader

.lr.ph48.new.preheader:                           ; preds = %.prol.loopexit67
  %.pre78 = load double, double* %8, align 8
  %15 = sub i64 %4, %indvars.iv61.unr.ph
  %16 = lshr i64 %15, 1
  %17 = and i64 %16, 1
  %lcmp.mod80 = icmp eq i64 %17, 0
  br i1 %lcmp.mod80, label %.lr.ph48.new.prol.preheader, label %.lr.ph48.new.prol.loopexit.unr-lcssa

.lr.ph48.new.prol.preheader:                      ; preds = %.lr.ph48.new.preheader
  br label %.lr.ph48.new.prol

.lr.ph48.new.prol:                                ; preds = %.lr.ph48.new.prol.preheader
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv61.unr.ph
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fsub double %.pre78, %20
  store double %21, double* %8, align 8
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.unr.ph, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next62.prol
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fsub double %21, %24
  store double %25, double* %8, align 8
  %indvars.iv.next62.1.prol = or i64 %indvars.iv61.unr.ph, 2
  br label %.lr.ph48.new.prol.loopexit.unr-lcssa

.lr.ph48.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph48.new.preheader, %.lr.ph48.new.prol
  %.unr.ph = phi double [ %25, %.lr.ph48.new.prol ], [ %.pre78, %.lr.ph48.new.preheader ]
  %indvars.iv61.unr.ph81 = phi i64 [ %indvars.iv.next62.1.prol, %.lr.ph48.new.prol ], [ %indvars.iv61.unr.ph, %.lr.ph48.new.preheader ]
  br label %.lr.ph48.new.prol.loopexit

.lr.ph48.new.prol.loopexit:                       ; preds = %.lr.ph48.new.prol.loopexit.unr-lcssa
  %26 = icmp eq i64 %16, 0
  br i1 %26, label %._crit_edge49.loopexit, label %.lr.ph48.new.preheader.new

.lr.ph48.new.preheader.new:                       ; preds = %.lr.ph48.new.prol.loopexit
  br label %.lr.ph48.new

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next57, %._crit_edge ]
  %27 = add nuw i64 %indvars.iv56, 4294967295
  %28 = icmp sgt i64 %indvars.iv56, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv56
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter77 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter77, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %30 = load double, double* %7, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 0
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %29, align 8
  %35 = fsub double %34, %33
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %36 = trunc i64 %27 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %29, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %38 = phi double [ %.pre, %.lr.ph.new.preheader ], [ %50, %.lr.ph.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %52 = load double, double* %51, align 8
  %53 = load double, double* %29, align 8
  %54 = fdiv double %53, %52
  store double %54, double* %29, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv72
  br i1 %exitcond, label %.lr.ph48, label %.preheader

.lr.ph48.new:                                     ; preds = %.lr.ph48.new, %.lr.ph48.new.preheader.new
  %55 = phi double [ %.unr.ph, %.lr.ph48.new.preheader.new ], [ %71, %.lr.ph48.new ]
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr.ph81, %.lr.ph48.new.preheader.new ], [ %indvars.iv.next62.1.1, %.lr.ph48.new ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv61
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %57
  %59 = fsub double %55, %58
  store double %59, double* %8, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next62
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %61
  %63 = fsub double %59, %62
  store double %63, double* %8, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next62.1
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %65
  %67 = fsub double %63, %66
  store double %67, double* %8, align 8
  %indvars.iv.next62.182 = add nsw i64 %indvars.iv61, 3
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next62.182
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %69
  %71 = fsub double %67, %70
  store double %71, double* %8, align 8
  %indvars.iv.next62.1.1 = add nsw i64 %indvars.iv61, 4
  %exitcond65.1.1 = icmp eq i64 %indvars.iv.next62.1.1, %indvars.iv72
  br i1 %exitcond65.1.1, label %._crit_edge49.loopexit.unr-lcssa, label %.lr.ph48.new

._crit_edge49.loopexit.unr-lcssa:                 ; preds = %.lr.ph48.new
  br label %._crit_edge49.loopexit

._crit_edge49.loopexit:                           ; preds = %.lr.ph48.new.prol.loopexit, %._crit_edge49.loopexit.unr-lcssa
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.prol.loopexit67, %.preheader44
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  %73 = load double, double* %72, align 8
  %74 = tail call double @sqrt(double %73) #3
  store double %74, double* %72, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %._crit_edge51.loopexit, label %.preheader44

._crit_edge51.loopexit:                           ; preds = %._crit_edge49
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %._crit_edge14

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count21 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.preheader.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv17 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next18, %._crit_edge..lr.ph_crit_edge ]
  %9 = mul nsw i64 %indvars.iv19, %8
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge23, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge23 ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge23

; <label>:14:                                     ; preds = %._crit_edge24
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge24, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv17
  br i1 %exitcond, label %._crit_edge, label %._crit_edge24

._crit_edge:                                      ; preds = %._crit_edge23
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge14.loopexit, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %.lr.ph

._crit_edge14.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
