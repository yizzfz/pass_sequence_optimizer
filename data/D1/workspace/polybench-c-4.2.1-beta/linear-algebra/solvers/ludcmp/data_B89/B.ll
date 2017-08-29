; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %3 to [2000 x double]*
  %12 = bitcast i8* %4 to double*
  %13 = bitcast i8* %5 to double*
  %14 = bitcast i8* %6 to double*
  call fastcc void @kernel_ludcmp([2000 x double]* %11, double* %12, double* %13, double* %14)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %15 = icmp sgt i32 %0, 42
  br i1 %15, label %16, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:16:                                     ; preds = %2
  %17 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %17, align 1
  %18 = icmp eq i8 %strcmpload, 0
  br i1 %18, label %19, label %.._crit_edge_crit_edge18

.._crit_edge_crit_edge18:                         ; preds = %16
  br label %._crit_edge

; <label>:19:                                     ; preds = %16
  %20 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %20)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge18, %.._crit_edge_crit_edge, %19
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph110.preheader:
  br label %.lr.ph110

.lr.ph110:                                        ; preds = %.lr.ph110..lr.ph110_crit_edge, %.lr.ph110.preheader
  %indvars.iv170 = phi i64 [ 0, %.lr.ph110.preheader ], [ %indvars.iv.next171.1, %.lr.ph110..lr.ph110_crit_edge ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv170
  store double 0.000000e+00, double* %4, align 8
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv170
  store double 0.000000e+00, double* %5, align 8
  %indvars.iv.next171 = or i64 %indvars.iv170, 1
  %6 = trunc i64 %indvars.iv.next171 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv170
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next171
  store double 0.000000e+00, double* %12, align 8
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next171
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  %14 = trunc i64 %indvars.iv.next171.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fmul double %16, 5.000000e-01
  %18 = fadd double %17, 4.000000e+00
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next171
  store double %18, double* %19, align 8
  %exitcond173.1 = icmp eq i64 %indvars.iv.next171.1, 2000
  br i1 %exitcond173.1, label %.lr.ph103.preheader, label %.lr.ph110..lr.ph110_crit_edge

.lr.ph110..lr.ph110_crit_edge:                    ; preds = %.lr.ph110
  br label %.lr.ph110

.lr.ph103.preheader:                              ; preds = %.lr.ph110
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %._crit_edge105..lr.ph103_crit_edge, %.lr.ph103.preheader
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %._crit_edge105..lr.ph103_crit_edge ], [ 0, %.lr.ph103.preheader ]
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %._crit_edge105..lr.ph103_crit_edge ], [ 1, %.lr.ph103.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv166, 2001
  %21 = add nuw nsw i64 %20, 1
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %21
  %22 = sub i64 1998, %indvars.iv166
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  br label %._crit_edge

.preheader86:                                     ; preds = %._crit_edge
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %25 = icmp slt i64 %indvars.iv.next167, 2000
  br i1 %25, label %._crit_edge105.loopexit, label %.preheader86.._crit_edge105_crit_edge

.preheader86.._crit_edge105_crit_edge:            ; preds = %.preheader86
  br label %._crit_edge105

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph103
  %indvars.iv150 = phi i64 [ 0, %.lr.ph103 ], [ %indvars.iv.next151, %._crit_edge.._crit_edge_crit_edge ]
  %26 = sub nsw i64 0, %indvars.iv150
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv166, i64 %indvars.iv150
  store double %31, double* %32, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond155 = icmp eq i64 %indvars.iv.next151, %indvars.iv164
  br i1 %exitcond155, label %.preheader86, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge105.loopexit:                          ; preds = %.preheader86
  %33 = add nuw nsw i64 %24, 8
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep162163, i8 0, i64 %33, i32 8, i1 false)
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %.preheader86.._crit_edge105_crit_edge, %._crit_edge105.loopexit
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv166, i64 %indvars.iv166
  store double 1.000000e+00, double* %34, align 8
  %exitcond169 = icmp eq i64 %indvars.iv.next167, 2000
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  br i1 %exitcond169, label %._crit_edge107, label %._crit_edge105..lr.ph103_crit_edge

._crit_edge105..lr.ph103_crit_edge:               ; preds = %._crit_edge105
  br label %.lr.ph103

._crit_edge107:                                   ; preds = %._crit_edge105
  %35 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %36 = bitcast i8* %35 to [2000 x [2000 x double]]*
  br label %._crit_edge100.us.3

.preheader82.us.us.preheader:                     ; preds = %._crit_edge96.us..preheader82.us.us.preheader_crit_edge, %.preheader82.us.us.preheader.preheader
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge96.us..preheader82.us.us.preheader_crit_edge ], [ 0, %.preheader82.us.us.preheader.preheader ]
  br label %.preheader82.us.us

._crit_edge96.us:                                 ; preds = %._crit_edge94.us.us
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next136, 2000
  br i1 %exitcond138, label %.preheader.us.preheader, label %._crit_edge96.us..preheader82.us.us.preheader_crit_edge

._crit_edge96.us..preheader82.us.us.preheader_crit_edge: ; preds = %._crit_edge96.us
  br label %.preheader82.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge96.us
  br label %.preheader.us

.preheader82.us.us:                               ; preds = %._crit_edge94.us.us..preheader82.us.us_crit_edge, %.preheader82.us.us.preheader
  %indvars.iv131 = phi i64 [ 0, %.preheader82.us.us.preheader ], [ %indvars.iv.next132, %._crit_edge94.us.us..preheader82.us.us_crit_edge ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv135
  br label %.preheader82.us.us.new

._crit_edge94.us.us:                              ; preds = %.preheader82.us.us.new
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next132, 2000
  br i1 %exitcond134, label %._crit_edge96.us, label %._crit_edge94.us.us..preheader82.us.us_crit_edge

._crit_edge94.us.us..preheader82.us.us_crit_edge: ; preds = %._crit_edge94.us.us
  br label %.preheader82.us.us

.preheader82.us.us.new:                           ; preds = %.preheader82.us.us.new..preheader82.us.us.new_crit_edge, %.preheader82.us.us
  %indvars.iv123 = phi i64 [ %indvars.iv.next124.1, %.preheader82.us.us.new..preheader82.us.us.new_crit_edge ], [ 0, %.preheader82.us.us ]
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv123, i64 %indvars.iv135
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv131, i64 %indvars.iv123
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %45 = load double, double* %37, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next124, i64 %indvars.iv135
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv131, i64 %indvars.iv.next124
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %exitcond126.1 = icmp eq i64 %indvars.iv.next124.1, 2000
  br i1 %exitcond126.1, label %._crit_edge94.us.us, label %.preheader82.us.us.new..preheader82.us.us.new_crit_edge

.preheader82.us.us.new..preheader82.us.us.new_crit_edge: ; preds = %.preheader82.us.us.new
  br label %.preheader82.us.us.new

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ 0, %.preheader.us ]
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv120, i64 %indvars.iv
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv120, i64 %indvars.iv
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv120, i64 %indvars.iv.next
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next.1
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv120, i64 %indvars.iv.next.1
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next.2
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv120, i64 %indvars.iv.next.2
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond = icmp eq i64 %indvars.iv.next121, 2000
  br i1 %exitcond, label %._crit_edge91, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge91:                                    ; preds = %._crit_edge.us
  call void @free(i8* %35) #4
  ret void

._crit_edge100.us.3:                              ; preds = %._crit_edge100.us.3.._crit_edge100.us.3_crit_edge, %._crit_edge107
  %indvars.iv143 = phi i64 [ 0, %._crit_edge107 ], [ %indvars.iv.next144.3.1, %._crit_edge100.us.3.._crit_edge100.us.3_crit_edge ]
  %72 = mul nuw nsw i64 %indvars.iv143, 16000
  %scevgep = getelementptr i8, i8* %35, i64 %72
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %73 = mul nuw nsw i64 %indvars.iv143, 16000
  %74 = add nuw nsw i64 %73, 16000
  %scevgep.1 = getelementptr i8, i8* %35, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %75 = mul nuw nsw i64 %indvars.iv143, 16000
  %76 = add nuw nsw i64 %75, 32000
  %scevgep.2 = getelementptr i8, i8* %35, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %77 = mul nuw nsw i64 %indvars.iv143, 16000
  %78 = add nuw nsw i64 %77, 48000
  %scevgep.3 = getelementptr i8, i8* %35, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next144.3 = or i64 %indvars.iv143, 4
  %79 = mul nuw nsw i64 %indvars.iv.next144.3, 16000
  %scevgep.11 = getelementptr i8, i8* %35, i64 %79
  call void @llvm.memset.p0i8.i64(i8* %scevgep.11, i8 0, i64 16000, i32 8, i1 false)
  %80 = mul nuw nsw i64 %indvars.iv.next144.3, 16000
  %81 = add nuw nsw i64 %80, 16000
  %scevgep.1.1 = getelementptr i8, i8* %35, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %82 = mul nuw nsw i64 %indvars.iv.next144.3, 16000
  %83 = add nuw nsw i64 %82, 32000
  %scevgep.2.1 = getelementptr i8, i8* %35, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %84 = mul nuw nsw i64 %indvars.iv.next144.3, 16000
  %85 = add nuw nsw i64 %84, 48000
  %scevgep.3.1 = getelementptr i8, i8* %35, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next144.3.1 = add nsw i64 %indvars.iv143, 8
  %exitcond146.3.1 = icmp eq i64 %indvars.iv.next144.3.1, 2000
  br i1 %exitcond146.3.1, label %.preheader82.us.us.preheader.preheader, label %._crit_edge100.us.3.._crit_edge100.us.3_crit_edge

._crit_edge100.us.3.._crit_edge100.us.3_crit_edge: ; preds = %._crit_edge100.us.3
  br label %._crit_edge100.us.3

.preheader82.us.us.preheader.preheader:           ; preds = %._crit_edge100.us.3
  br label %.preheader82.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]*, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader95.preheader:
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge130..preheader95_crit_edge, %.preheader95.preheader
  %indvars.iv214 = phi i2 [ %indvars.iv.next215, %._crit_edge130..preheader95_crit_edge ], [ 0, %.preheader95.preheader ]
  %indvars.iv212 = phi i64 [ %indvars.iv.next213, %._crit_edge130..preheader95_crit_edge ], [ 1, %.preheader95.preheader ]
  %indvars.iv195 = phi i64 [ %indvars.iv.next196, %._crit_edge130..preheader95_crit_edge ], [ 0, %.preheader95.preheader ]
  %4 = zext i2 %indvars.iv214 to i64
  %5 = add nuw nsw i64 %4, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = add i64 %indvars.iv212, %6
  %8 = add nuw i64 %indvars.iv195, 4294967295
  %9 = sub i64 2000, %indvars.iv195
  %10 = trunc i64 %9 to i32
  %11 = sub i64 4294969295, %indvars.iv195
  %12 = trunc i64 %11 to i32
  %13 = icmp sgt i64 %indvars.iv195, 0
  br i1 %13, label %.preheader95..lr.ph120_crit_edge, label %.preheader95..lr.ph129.split.preheader_crit_edge

.preheader95..lr.ph129.split.preheader_crit_edge: ; preds = %.preheader95
  br label %.lr.ph129.split.preheader

.preheader95..lr.ph120_crit_edge:                 ; preds = %.preheader95
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 0
  br label %.lr.ph120

.lr.ph129:                                        ; preds = %._crit_edge117
  %15 = icmp sgt i64 %indvars.iv195, 0
  br i1 %15, label %.lr.ph129..lr.ph129.split.us_crit_edge, label %.lr.ph129..lr.ph129.split.preheader_crit_edge

.lr.ph129..lr.ph129.split.preheader_crit_edge:    ; preds = %.lr.ph129
  br label %.lr.ph129.split.preheader

.lr.ph129..lr.ph129.split.us_crit_edge:           ; preds = %.lr.ph129
  %xtraiter185199 = and i64 %indvars.iv195, 1
  %lcmp.mod186 = icmp eq i64 %xtraiter185199, 0
  %16 = trunc i64 %8 to i32
  %17 = icmp eq i32 %16, 0
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 0
  br label %.lr.ph129.split.us

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129..lr.ph129.split.preheader_crit_edge, %.preheader95..lr.ph129.split.preheader_crit_edge
  %xtraiter174 = and i32 %10, 3
  %lcmp.mod175 = icmp eq i32 %xtraiter174, 0
  br i1 %lcmp.mod175, label %.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge, label %.lr.ph129.split.prol.preheader

.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge: ; preds = %.lr.ph129.split.preheader
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.preheader:                   ; preds = %.lr.ph129.split.preheader
  br label %.lr.ph129.split.prol

.lr.ph129.split.prol:                             ; preds = %.lr.ph129.split.prol..lr.ph129.split.prol_crit_edge, %.lr.ph129.split.prol.preheader
  %indvars.iv170.prol = phi i64 [ %indvars.iv.next171.prol, %.lr.ph129.split.prol..lr.ph129.split.prol_crit_edge ], [ %indvars.iv195, %.lr.ph129.split.prol.preheader ]
  %prol.iter176 = phi i32 [ %prol.iter176.sub, %.lr.ph129.split.prol..lr.ph129.split.prol_crit_edge ], [ %xtraiter174, %.lr.ph129.split.prol.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv170.prol
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv170.prol
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next171.prol = add nuw nsw i64 %indvars.iv170.prol, 1
  %prol.iter176.sub = add nsw i32 %prol.iter176, -1
  %prol.iter176.cmp = icmp eq i32 %prol.iter176.sub, 0
  br i1 %prol.iter176.cmp, label %.lr.ph129.split.prol.loopexit.loopexit, label %.lr.ph129.split.prol..lr.ph129.split.prol_crit_edge, !llvm.loop !1

.lr.ph129.split.prol..lr.ph129.split.prol_crit_edge: ; preds = %.lr.ph129.split.prol
  br label %.lr.ph129.split.prol

.lr.ph129.split.prol.loopexit.loopexit:           ; preds = %.lr.ph129.split.prol
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.loopexit:                    ; preds = %.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge, %.lr.ph129.split.prol.loopexit.loopexit
  %indvars.iv170.unr = phi i64 [ %indvars.iv195, %.lr.ph129.split.preheader..lr.ph129.split.prol.loopexit_crit_edge ], [ %7, %.lr.ph129.split.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %12, 3
  br i1 %24, label %.lr.ph129.split.prol.loopexit.._crit_edge130_crit_edge, label %.lr.ph129.split.preheader227

.lr.ph129.split.prol.loopexit.._crit_edge130_crit_edge: ; preds = %.lr.ph129.split.prol.loopexit
  br label %._crit_edge130

.lr.ph129.split.preheader227:                     ; preds = %.lr.ph129.split.prol.loopexit
  br label %.lr.ph129.split

.lr.ph129.split.us:                               ; preds = %._crit_edge125.us..lr.ph129.split.us_crit_edge, %.lr.ph129..lr.ph129.split.us_crit_edge
  %indvars.iv189 = phi i64 [ %indvars.iv195, %.lr.ph129..lr.ph129.split.us_crit_edge ], [ %indvars.iv.next190, %._crit_edge125.us..lr.ph129.split.us_crit_edge ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv189
  %26 = load double, double* %25, align 8
  br i1 %lcmp.mod186, label %.lr.ph129.split.us..prol.loopexit184_crit_edge, label %.prol.preheader183

.lr.ph129.split.us..prol.loopexit184_crit_edge:   ; preds = %.lr.ph129.split.us
  br label %.prol.loopexit184

.prol.preheader183:                               ; preds = %.lr.ph129.split.us
  %27 = load double, double* %18, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv189
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %26, %30
  br label %.prol.loopexit184

.prol.loopexit184:                                ; preds = %.lr.ph129.split.us..prol.loopexit184_crit_edge, %.prol.preheader183
  %indvars.iv177.unr.ph = phi i64 [ 1, %.prol.preheader183 ], [ 0, %.lr.ph129.split.us..prol.loopexit184_crit_edge ]
  %.1122.us.unr.ph = phi double [ %31, %.prol.preheader183 ], [ %26, %.lr.ph129.split.us..prol.loopexit184_crit_edge ]
  %.lcssa136.unr.ph = phi double [ %31, %.prol.preheader183 ], [ undef, %.lr.ph129.split.us..prol.loopexit184_crit_edge ]
  br i1 %17, label %.prol.loopexit184.._crit_edge125.us_crit_edge, label %.lr.ph129.split.us.new.preheader

.prol.loopexit184.._crit_edge125.us_crit_edge:    ; preds = %.prol.loopexit184
  br label %._crit_edge125.us

.lr.ph129.split.us.new.preheader:                 ; preds = %.prol.loopexit184
  br label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge, %.lr.ph129.split.us.new.preheader
  %indvars.iv177 = phi i64 [ %indvars.iv.next178.1, %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge ], [ %indvars.iv177.unr.ph, %.lr.ph129.split.us.new.preheader ]
  %.1122.us = phi double [ %43, %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge ], [ %.1122.us.unr.ph, %.lr.ph129.split.us.new.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv177
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv177, i64 %indvars.iv189
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %.1122.us, %36
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next178
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next178, i64 %indvars.iv189
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %37, %42
  %indvars.iv.next178.1 = add nsw i64 %indvars.iv177, 2
  %exitcond182.1 = icmp eq i64 %indvars.iv.next178.1, %indvars.iv195
  br i1 %exitcond182.1, label %._crit_edge125.us.loopexit, label %.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge

.lr.ph129.split.us.new..lr.ph129.split.us.new_crit_edge: ; preds = %.lr.ph129.split.us.new
  br label %.lr.ph129.split.us.new

._crit_edge125.us.loopexit:                       ; preds = %.lr.ph129.split.us.new
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %.prol.loopexit184.._crit_edge125.us_crit_edge, %._crit_edge125.us.loopexit
  %.lcssa136 = phi double [ %.lcssa136.unr.ph, %.prol.loopexit184.._crit_edge125.us_crit_edge ], [ %43, %._crit_edge125.us.loopexit ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv189
  store double %.lcssa136, double* %44, align 8
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next190, 2000
  br i1 %exitcond192, label %._crit_edge130.loopexit, label %._crit_edge125.us..lr.ph129.split.us_crit_edge

._crit_edge125.us..lr.ph129.split.us_crit_edge:   ; preds = %._crit_edge125.us
  br label %.lr.ph129.split.us

.lr.ph120:                                        ; preds = %._crit_edge117..lr.ph120_crit_edge, %.preheader95..lr.ph120_crit_edge
  %indvars.iv162 = phi i64 [ 0, %.preheader95..lr.ph120_crit_edge ], [ %indvars.iv.next163, %._crit_edge117..lr.ph120_crit_edge ]
  %45 = add nuw i64 %indvars.iv162, 4294967295
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv162
  %47 = load double, double* %46, align 8
  %48 = icmp sgt i64 %indvars.iv162, 0
  br i1 %48, label %.lr.ph116, label %.lr.ph120.._crit_edge117_crit_edge

.lr.ph120.._crit_edge117_crit_edge:               ; preds = %.lr.ph120
  br label %._crit_edge117

.lr.ph116:                                        ; preds = %.lr.ph120
  %xtraiter158200 = and i64 %indvars.iv162, 1
  %lcmp.mod159 = icmp eq i64 %xtraiter158200, 0
  br i1 %lcmp.mod159, label %.lr.ph116..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph116..prol.loopexit_crit_edge:               ; preds = %.lr.ph116
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph116
  %49 = load double, double* %14, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv162
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph116..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv153.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph116..prol.loopexit_crit_edge ]
  %.0114.unr.ph = phi double [ %53, %.prol.preheader ], [ %47, %.lr.ph116..prol.loopexit_crit_edge ]
  %.lcssa135.unr.ph = phi double [ %53, %.prol.preheader ], [ undef, %.lr.ph116..prol.loopexit_crit_edge ]
  %54 = trunc i64 %45 to i32
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %.prol.loopexit.._crit_edge117_crit_edge, label %.lr.ph116.new.preheader

.prol.loopexit.._crit_edge117_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge117

.lr.ph116.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph116.new

.lr.ph116.new:                                    ; preds = %.lr.ph116.new..lr.ph116.new_crit_edge, %.lr.ph116.new.preheader
  %indvars.iv153 = phi i64 [ %indvars.iv.next154.1, %.lr.ph116.new..lr.ph116.new_crit_edge ], [ %indvars.iv153.unr.ph, %.lr.ph116.new.preheader ]
  %.0114 = phi double [ %67, %.lr.ph116.new..lr.ph116.new_crit_edge ], [ %.0114.unr.ph, %.lr.ph116.new.preheader ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv153
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv153, i64 %indvars.iv162
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %.0114, %60
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next154
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next154, i64 %indvars.iv162
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %61, %66
  %indvars.iv.next154.1 = add nsw i64 %indvars.iv153, 2
  %exitcond157.1 = icmp eq i64 %indvars.iv.next154.1, %indvars.iv162
  br i1 %exitcond157.1, label %._crit_edge117.loopexit, label %.lr.ph116.new..lr.ph116.new_crit_edge

.lr.ph116.new..lr.ph116.new_crit_edge:            ; preds = %.lr.ph116.new
  br label %.lr.ph116.new

._crit_edge117.loopexit:                          ; preds = %.lr.ph116.new
  br label %._crit_edge117

._crit_edge117:                                   ; preds = %.prol.loopexit.._crit_edge117_crit_edge, %.lr.ph120.._crit_edge117_crit_edge, %._crit_edge117.loopexit
  %.0.lcssa = phi double [ %47, %.lr.ph120.._crit_edge117_crit_edge ], [ %.lcssa135.unr.ph, %.prol.loopexit.._crit_edge117_crit_edge ], [ %67, %._crit_edge117.loopexit ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv162, i64 %indvars.iv162
  %69 = load double, double* %68, align 8
  %70 = fdiv double %.0.lcssa, %69
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv162
  store double %70, double* %71, align 8
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next163, %indvars.iv195
  br i1 %exitcond167, label %.lr.ph129, label %._crit_edge117..lr.ph120_crit_edge

._crit_edge117..lr.ph120_crit_edge:               ; preds = %._crit_edge117
  br label %.lr.ph120

.lr.ph129.split:                                  ; preds = %.lr.ph129.split..lr.ph129.split_crit_edge, %.lr.ph129.split.preheader227
  %indvars.iv170 = phi i64 [ %indvars.iv.next171.3, %.lr.ph129.split..lr.ph129.split_crit_edge ], [ %indvars.iv170.unr, %.lr.ph129.split.preheader227 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv170
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv170
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next171
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next171
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next171.1
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next171.1
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next171.2 = add nsw i64 %indvars.iv170, 3
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next171.2
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv195, i64 %indvars.iv.next171.2
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next171.3 = add nsw i64 %indvars.iv170, 4
  %exitcond172.3 = icmp eq i64 %indvars.iv.next171.3, 2000
  br i1 %exitcond172.3, label %._crit_edge130.loopexit228, label %.lr.ph129.split..lr.ph129.split_crit_edge

.lr.ph129.split..lr.ph129.split_crit_edge:        ; preds = %.lr.ph129.split
  br label %.lr.ph129.split

._crit_edge130.loopexit:                          ; preds = %._crit_edge125.us
  br label %._crit_edge130

._crit_edge130.loopexit228:                       ; preds = %.lr.ph129.split
  br label %._crit_edge130

._crit_edge130:                                   ; preds = %.lr.ph129.split.prol.loopexit.._crit_edge130_crit_edge, %._crit_edge130.loopexit228, %._crit_edge130.loopexit
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next196, 2000
  br i1 %exitcond198, label %.lr.ph112.preheader, label %._crit_edge130..preheader95_crit_edge

.lr.ph112.preheader:                              ; preds = %._crit_edge130
  br label %.lr.ph112

._crit_edge130..preheader95_crit_edge:            ; preds = %._crit_edge130
  %indvars.iv.next213 = add nuw i64 %indvars.iv212, 1
  %indvars.iv.next215 = add i2 %indvars.iv214, -1
  br label %.preheader95

.lr.ph112:                                        ; preds = %._crit_edge108..lr.ph112_crit_edge, %.lr.ph112.preheader
  %indvars.iv210 = phi i2 [ %indvars.iv.next211, %._crit_edge108..lr.ph112_crit_edge ], [ 0, %.lr.ph112.preheader ]
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge108..lr.ph112_crit_edge ], [ 0, %.lr.ph112.preheader ]
  %92 = zext i2 %indvars.iv210 to i64
  %93 = add nuw nsw i64 %92, 4294967295
  %94 = and i64 %93, 4294967295
  %95 = add nuw nsw i64 %94, 1
  %96 = add nuw i64 %indvars.iv150, 4294967295
  %97 = getelementptr inbounds double, double* %1, i64 %indvars.iv150
  %98 = load double, double* %97, align 8
  %99 = icmp sgt i64 %indvars.iv150, 0
  br i1 %99, label %.lr.ph107.preheader, label %.lr.ph112.._crit_edge108_crit_edge

.lr.ph112.._crit_edge108_crit_edge:               ; preds = %.lr.ph112
  br label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %.lr.ph112
  %100 = trunc i64 %indvars.iv150 to i32
  %xtraiter143 = and i32 %100, 3
  %lcmp.mod144 = icmp eq i32 %xtraiter143, 0
  br i1 %lcmp.mod144, label %.lr.ph107.preheader..lr.ph107.prol.loopexit_crit_edge, label %.lr.ph107.prol.preheader

.lr.ph107.preheader..lr.ph107.prol.loopexit_crit_edge: ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol..lr.ph107.prol_crit_edge, %.lr.ph107.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph107.prol..lr.ph107.prol_crit_edge ], [ 0, %.lr.ph107.prol.preheader ]
  %.2105.prol = phi double [ %106, %.lr.ph107.prol..lr.ph107.prol_crit_edge ], [ %98, %.lr.ph107.prol.preheader ]
  %prol.iter146 = phi i32 [ %prol.iter146.sub, %.lr.ph107.prol..lr.ph107.prol_crit_edge ], [ %xtraiter143, %.lr.ph107.prol.preheader ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv.prol
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds double, double* %3, i64 %indvars.iv.prol
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = fsub double %.2105.prol, %105
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter146.sub = add nsw i32 %prol.iter146, -1
  %prol.iter146.cmp = icmp eq i32 %prol.iter146.sub, 0
  br i1 %prol.iter146.cmp, label %.lr.ph107.prol.loopexit.loopexit, label %.lr.ph107.prol..lr.ph107.prol_crit_edge, !llvm.loop !3

.lr.ph107.prol..lr.ph107.prol_crit_edge:          ; preds = %.lr.ph107.prol
  br label %.lr.ph107.prol

.lr.ph107.prol.loopexit.loopexit:                 ; preds = %.lr.ph107.prol
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.preheader..lr.ph107.prol.loopexit_crit_edge, %.lr.ph107.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph107.preheader..lr.ph107.prol.loopexit_crit_edge ], [ %95, %.lr.ph107.prol.loopexit.loopexit ]
  %.2105.unr = phi double [ %98, %.lr.ph107.preheader..lr.ph107.prol.loopexit_crit_edge ], [ %106, %.lr.ph107.prol.loopexit.loopexit ]
  %.lcssa134.unr = phi double [ undef, %.lr.ph107.preheader..lr.ph107.prol.loopexit_crit_edge ], [ %106, %.lr.ph107.prol.loopexit.loopexit ]
  %107 = trunc i64 %96 to i32
  %108 = icmp ult i32 %107, 3
  br i1 %108, label %.lr.ph107.prol.loopexit.._crit_edge108_crit_edge, label %.lr.ph107.preheader226

.lr.ph107.prol.loopexit.._crit_edge108_crit_edge: ; preds = %.lr.ph107.prol.loopexit
  br label %._crit_edge108

.lr.ph107.preheader226:                           ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107..lr.ph107_crit_edge, %.lr.ph107.preheader226
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph107..lr.ph107_crit_edge ], [ %indvars.iv.unr, %.lr.ph107.preheader226 ]
  %.2105 = phi double [ %132, %.lr.ph107..lr.ph107_crit_edge ], [ %.2105.unr, %.lr.ph107.preheader226 ]
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fsub double %.2105, %113
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv.next
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fsub double %114, %119
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv.next.1
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fsub double %120, %125
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv.next.2
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.2
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fsub double %126, %131
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3147 = icmp eq i64 %indvars.iv.next.3, %indvars.iv150
  br i1 %exitcond.3147, label %._crit_edge108.loopexit, label %.lr.ph107..lr.ph107_crit_edge

.lr.ph107..lr.ph107_crit_edge:                    ; preds = %.lr.ph107
  br label %.lr.ph107

._crit_edge108.loopexit:                          ; preds = %.lr.ph107
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %.lr.ph107.prol.loopexit.._crit_edge108_crit_edge, %.lr.ph112.._crit_edge108_crit_edge, %._crit_edge108.loopexit
  %.2.lcssa = phi double [ %98, %.lr.ph112.._crit_edge108_crit_edge ], [ %.lcssa134.unr, %.lr.ph107.prol.loopexit.._crit_edge108_crit_edge ], [ %132, %._crit_edge108.loopexit ]
  %133 = getelementptr inbounds double, double* %3, i64 %indvars.iv150
  store double %.2.lcssa, double* %133, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond = icmp eq i64 %indvars.iv.next151, 2000
  %indvars.iv.next211 = add i2 %indvars.iv210, 1
  br i1 %exitcond, label %.lr.ph102.preheader, label %._crit_edge108..lr.ph112_crit_edge

._crit_edge108..lr.ph112_crit_edge:               ; preds = %._crit_edge108
  br label %.lr.ph112

.lr.ph102.preheader:                              ; preds = %._crit_edge108
  br label %.lr.ph102

.lr.ph102:                                        ; preds = %.lr.ph102.preheader, %._crit_edge..lr.ph102_crit_edge
  %indvars.iv208 = phi i2 [ %indvars.iv.next209, %._crit_edge..lr.ph102_crit_edge ], [ 0, %.lr.ph102.preheader ]
  %indvars.iv206 = phi i64 [ %indvars.iv.next207, %._crit_edge..lr.ph102_crit_edge ], [ 2001, %.lr.ph102.preheader ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge..lr.ph102_crit_edge ], [ 2000, %.lr.ph102.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge..lr.ph102_crit_edge ], [ 0, %.lr.ph102.preheader ]
  %134 = zext i2 %indvars.iv208 to i64
  %135 = add nuw nsw i64 %134, 4294967295
  %136 = and i64 %135, 4294967295
  %137 = add i64 %indvars.iv206, %136
  %138 = add nsw i32 %indvar, -1
  %indvars.iv.next140 = add nsw i64 %indvars.iv139, -1
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next140
  %140 = load double, double* %139, align 8
  %141 = icmp slt i64 %indvars.iv139, 2000
  br i1 %141, label %.lr.ph.preheader, label %.lr.ph102.._crit_edge_crit_edge

.lr.ph102.._crit_edge_crit_edge:                  ; preds = %.lr.ph102
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph102
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol.preheader

.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge:  ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %.lr.ph.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %indvars.iv139, %.lr.ph.prol.preheader ]
  %.398.prol = phi double [ %147, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %140, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next140, i64 %indvars.iv137.prol
  %143 = load double, double* %142, align 8
  %144 = getelementptr inbounds double, double* %2, i64 %indvars.iv137.prol
  %145 = load double, double* %144, align 8
  %146 = fmul double %143, %145
  %147 = fsub double %.398.prol, %146
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !4

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  br label %.lr.ph.prol

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, %.lr.ph.prol.loopexit.loopexit
  %indvars.iv137.unr = phi i64 [ %indvars.iv139, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %137, %.lr.ph.prol.loopexit.loopexit ]
  %.398.unr = phi double [ %140, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %147, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %147, %.lr.ph.prol.loopexit.loopexit ]
  %148 = icmp ult i32 %138, 3
  br i1 %148, label %.lr.ph.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.preheader225

.lr.ph.prol.loopexit.._crit_edge_crit_edge:       ; preds = %.lr.ph.prol.loopexit
  br label %._crit_edge

.lr.ph.preheader225:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader225
  %indvars.iv137 = phi i64 [ %indvars.iv.next138.3, %.lr.ph..lr.ph_crit_edge ], [ %indvars.iv137.unr, %.lr.ph.preheader225 ]
  %.398 = phi double [ %172, %.lr.ph..lr.ph_crit_edge ], [ %.398.unr, %.lr.ph.preheader225 ]
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next140, i64 %indvars.iv137
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds double, double* %2, i64 %indvars.iv137
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fsub double %.398, %153
  %indvars.iv.next138 = add nsw i64 %indvars.iv137, 1
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next140, i64 %indvars.iv.next138
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next138
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fsub double %154, %159
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next140, i64 %indvars.iv.next138.1
  %162 = load double, double* %161, align 8
  %163 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next138.1
  %164 = load double, double* %163, align 8
  %165 = fmul double %162, %164
  %166 = fsub double %160, %165
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next140, i64 %indvars.iv.next138.2
  %168 = load double, double* %167, align 8
  %169 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next138.2
  %170 = load double, double* %169, align 8
  %171 = fmul double %168, %170
  %172 = fsub double %166, %171
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next138.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit.._crit_edge_crit_edge, %.lr.ph102.._crit_edge_crit_edge, %._crit_edge.loopexit
  %.3.lcssa = phi double [ %140, %.lr.ph102.._crit_edge_crit_edge ], [ %.lcssa.unr, %.lr.ph.prol.loopexit.._crit_edge_crit_edge ], [ %172, %._crit_edge.loopexit ]
  %173 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next140, i64 %indvars.iv.next140
  %174 = load double, double* %173, align 8
  %175 = fdiv double %.3.lcssa, %174
  %176 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next140
  store double %175, double* %176, align 8
  %177 = icmp sgt i64 %indvars.iv139, 1
  br i1 %177, label %._crit_edge..lr.ph102_crit_edge, label %._crit_edge103

._crit_edge..lr.ph102_crit_edge:                  ; preds = %._crit_edge
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next207 = add i64 %indvars.iv206, -1
  %indvars.iv.next209 = add i2 %indvars.iv208, 1
  br label %.lr.ph102

._crit_edge103:                                   ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
..lr.ph_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge..lr.ph_crit_edge, %..lr.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next, %.lr.ph._crit_edge..lr.ph_crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph..lr.ph._crit_edge_crit_edge

.lr.ph..lr.ph._crit_edge_crit_edge:               ; preds = %.lr.ph
  br label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph..lr.ph._crit_edge_crit_edge, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph._crit_edge..lr.ph_crit_edge

.lr.ph._crit_edge..lr.ph_crit_edge:               ; preds = %.lr.ph._crit_edge
  br label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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
!4 = distinct !{!4, !2}
