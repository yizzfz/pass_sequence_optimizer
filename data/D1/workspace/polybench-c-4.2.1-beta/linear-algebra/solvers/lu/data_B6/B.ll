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
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader73.lr.ph, label %._crit_edge102.thread

._crit_edge102.thread:                            ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* %95) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader44.preheader, label %._crit_edge55

.preheader44.preheader:                           ; preds = %2
  %wide.trip.count80 = zext i32 %0 to i64
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.preheader
  %indvars.iv84 = phi i64 [ 0, %.preheader44.preheader ], [ %indvars.iv.next85, %._crit_edge51 ]
  %4 = add nuw i64 %indvars.iv84, 4294967295
  %5 = icmp sgt i64 %indvars.iv84, 0
  br i1 %5, label %.preheader42.preheader, label %._crit_edge51

.preheader42.preheader:                           ; preds = %.preheader44
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 0
  br label %.preheader42

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter7488 = and i64 %indvars.iv84, 1
  %lcmp.mod75 = icmp eq i64 %xtraiter7488, 0
  %7 = trunc i64 %4 to i32
  %8 = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge49.us, %.preheader.us.preheader
  %indvars.iv78 = phi i64 [ %indvars.iv84, %.preheader.us.preheader ], [ %indvars.iv.next79, %._crit_edge49.us ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv78
  br i1 %lcmp.mod75, label %.prol.loopexit73, label %.prol.preheader72

.prol.preheader72:                                ; preds = %.preheader.us
  %10 = load double, double* %6, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv78
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = load double, double* %9, align 8
  %15 = fsub double %14, %13
  store double %15, double* %9, align 8
  br label %.prol.loopexit73

.prol.loopexit73:                                 ; preds = %.preheader.us, %.prol.preheader72
  %indvars.iv67.unr.ph = phi i64 [ 1, %.prol.preheader72 ], [ 0, %.preheader.us ]
  br i1 %8, label %._crit_edge49.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit73
  %.pre90 = load double, double* %9, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %16 = phi double [ %.pre90, %.preheader.us.new.preheader ], [ %28, %.preheader.us.new ]
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next68.1, %.preheader.us.new ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv67
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv67, i64 %indvars.iv78
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv.next68
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next68, i64 %indvars.iv78
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %9, align 8
  %indvars.iv.next68.1 = add nuw nsw i64 %indvars.iv67, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next68.1, %indvars.iv84
  br i1 %exitcond71.1, label %._crit_edge49.us.loopexit, label %.preheader.us.new

._crit_edge49.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %._crit_edge49.us.loopexit, %.prol.loopexit73
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge51.loopexit, label %.preheader.us

.preheader42:                                     ; preds = %._crit_edge, %.preheader42.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader42.preheader ], [ %indvars.iv.next62, %._crit_edge ]
  %29 = add nuw i64 %indvars.iv61, 4294967295
  %30 = icmp sgt i64 %indvars.iv61, 0
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv61
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader42
  %xtraiter89 = and i64 %indvars.iv61, 1
  %lcmp.mod = icmp eq i64 %xtraiter89, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %32 = load double, double* %6, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv61
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %31, align 8
  %37 = fsub double %36, %35
  store double %37, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %38 = trunc i64 %29 to i32
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %31, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %40 = phi double [ %.pre, %.lr.ph.new.preheader ], [ %52, %.lr.ph.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv61
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %40, %45
  store double %46, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv61
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv61
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader42
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv61
  %54 = load double, double* %53, align 8
  %55 = load double, double* %31, align 8
  %56 = fdiv double %55, %54
  store double %56, double* %31, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next62, %indvars.iv84
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader42

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader44
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count80
  br i1 %exitcond87, label %._crit_edge55.loopexit, label %.preheader44

._crit_edge55.loopexit:                           ; preds = %._crit_edge51
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge19
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
