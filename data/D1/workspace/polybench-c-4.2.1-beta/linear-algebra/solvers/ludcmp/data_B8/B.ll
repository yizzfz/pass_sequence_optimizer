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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
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
  br i1 %8, label %.lr.ph174.preheader, label %._crit_edge171.thread

.lr.ph174.preheader:                              ; preds = %5
  %xtraiter194 = and i64 %7, 1
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %.lr.ph174.prol.loopexit, label %.lr.ph174.prol

.lr.ph174.prol:                                   ; preds = %.lr.ph174.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %9 = fdiv double 1.000000e+00, %6
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  store double %11, double* %2, align 8
  br label %.lr.ph174.prol.loopexit

.lr.ph174.prol.loopexit:                          ; preds = %.lr.ph174.preheader, %.lr.ph174.prol
  %indvars.iv126172.unr = phi i64 [ 0, %.lr.ph174.preheader ], [ 1, %.lr.ph174.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %.preheader86.preheader.lr.ph, label %.lr.ph174.preheader208

.lr.ph174.preheader208:                           ; preds = %.lr.ph174.prol.loopexit
  %13 = insertelement <2 x double> undef, double %6, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph174

.preheader87:                                     ; preds = %.lr.ph174
  %15 = sext i32 %0 to i64
  %16 = icmp sgt i32 %0, 0
  br i1 %16, label %.preheader86.preheader.lr.ph, label %._crit_edge171.thread

.preheader86.preheader.lr.ph:                     ; preds = %.lr.ph174.prol.loopexit, %.preheader87
  %17 = phi i64 [ %15, %.preheader87 ], [ 1, %.lr.ph174.prol.loopexit ]
  %wide.trip.count120 = sext i32 %0 to i64
  %18 = shl nsw i64 %17, 3
  %19 = add nsw i64 %18, -8
  br label %.preheader86.preheader

.lr.ph174:                                        ; preds = %.lr.ph174.preheader208, %.lr.ph174
  %indvars.iv126172 = phi i64 [ %indvars.iv.next127.1, %.lr.ph174 ], [ %indvars.iv126172.unr, %.lr.ph174.preheader208 ]
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv126172
  %21 = bitcast double* %20 to <2 x double>*
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv126172
  %23 = bitcast double* %22 to <2 x double>*
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126172, 1
  %24 = trunc i64 %indvars.iv.next127 to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv126172
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %indvars.iv.next127.1 = add nsw i64 %indvars.iv126172, 2
  %27 = trunc i64 %indvars.iv.next127.1 to i32
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, %14
  %32 = fmul <2 x double> %31, <double 5.000000e-01, double 5.000000e-01>
  %33 = fadd <2 x double> %32, <double 4.000000e+00, double 4.000000e+00>
  %34 = bitcast double* %26 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %exitcond193.1 = icmp eq i64 %indvars.iv.next127.1, %7
  br i1 %exitcond193.1, label %.preheader87, label %.lr.ph174

.preheader86.preheader:                           ; preds = %._crit_edge165, %.preheader86.preheader.lr.ph
  %indvars.iv = phi i64 [ 1, %.preheader86.preheader.lr.ph ], [ %indvars.iv.next191, %._crit_edge165 ]
  %indvars.iv119169 = phi [2000 x double]* [ %1, %.preheader86.preheader.lr.ph ], [ %48, %._crit_edge165 ]
  %indvars.iv124166 = phi i64 [ 0, %.preheader86.preheader.lr.ph ], [ %indvars.iv.next125, %._crit_edge165 ]
  %35 = mul nuw nsw i64 %indvars.iv124166, 2001
  %36 = add nuw nsw i64 %35, 1
  %scevgep189 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %36
  %scevgep189190 = bitcast double* %scevgep189 to i8*
  %37 = mul nsw i64 %indvars.iv124166, -8
  %38 = add nsw i64 %19, %37
  br label %.preheader86

.preheader86:                                     ; preds = %.preheader86.preheader, %.preheader86
  %indvars.iv107160 = phi i64 [ 0, %.preheader86.preheader ], [ %indvars.iv.next108, %.preheader86 ]
  %39 = sub nsw i64 0, %indvars.iv107160
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %6
  %44 = fadd double %43, 1.000000e+00
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124166, i64 %indvars.iv107160
  store double %44, double* %45, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107160, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next108, %indvars.iv
  br i1 %exitcond112, label %46, label %.preheader86

; <label>:46:                                     ; preds = %.preheader86
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124166, 1
  %exitcond121161 = icmp eq i64 %indvars.iv, %wide.trip.count120
  br i1 %exitcond121161, label %._crit_edge165, label %._crit_edge165.loopexit

._crit_edge165.loopexit:                          ; preds = %46
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep189190, i8 0, i64 %38, i32 8, i1 false)
  br label %._crit_edge165

._crit_edge165:                                   ; preds = %._crit_edge165.loopexit, %46
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv119169, i64 0, i64 %indvars.iv124166
  store double 1.000000e+00, double* %47, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv119169, i64 1, i64 0
  %48 = bitcast double* %scevgep to [2000 x double]*
  %exitcond192 = icmp eq i64 %indvars.iv.next125, %17
  br i1 %exitcond192, label %._crit_edge171, label %.preheader86.preheader

._crit_edge171.thread:                            ; preds = %.preheader87, %5
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge

._crit_edge171:                                   ; preds = %._crit_edge165
  %50 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %51 = bitcast i8* %50 to [2000 x [2000 x double]]*
  %52 = sext i32 %0 to i64
  %53 = icmp sgt i32 %0, 0
  br i1 %53, label %.preheader85.preheader.preheader, label %._crit_edge

.preheader85.preheader.preheader:                 ; preds = %._crit_edge171
  %wide.trip.count103 = zext i32 %0 to i64
  %54 = shl nuw nsw i64 %wide.trip.count103, 3
  %55 = add nsw i64 %52, -1
  %xtraiter186 = and i64 %52, 3
  %lcmp.mod187 = icmp eq i64 %xtraiter186, 0
  br i1 %lcmp.mod187, label %.preheader85.preheader.prol.loopexit, label %.preheader85._crit_edge.prol.preheader

.preheader85._crit_edge.prol.preheader:           ; preds = %.preheader85.preheader.preheader
  br label %.preheader85._crit_edge.prol

.preheader85._crit_edge.prol:                     ; preds = %.preheader85._crit_edge.prol.preheader, %.preheader85._crit_edge.prol
  %indvars.iv105158.prol = phi i64 [ %indvars.iv.next106.prol, %.preheader85._crit_edge.prol ], [ 0, %.preheader85._crit_edge.prol.preheader ]
  %prol.iter188 = phi i64 [ %prol.iter188.sub, %.preheader85._crit_edge.prol ], [ %xtraiter186, %.preheader85._crit_edge.prol.preheader ]
  %56 = mul nuw nsw i64 %indvars.iv105158.prol, 16000
  %scevgep184.prol = getelementptr i8, i8* %50, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.prol, i8 0, i64 %54, i32 8, i1 false)
  %indvars.iv.next106.prol = add nuw nsw i64 %indvars.iv105158.prol, 1
  %prol.iter188.sub = add i64 %prol.iter188, -1
  %prol.iter188.cmp = icmp eq i64 %prol.iter188.sub, 0
  br i1 %prol.iter188.cmp, label %.preheader85.preheader.prol.loopexit.loopexit, label %.preheader85._crit_edge.prol, !llvm.loop !1

.preheader85.preheader.prol.loopexit.loopexit:    ; preds = %.preheader85._crit_edge.prol
  br label %.preheader85.preheader.prol.loopexit

.preheader85.preheader.prol.loopexit:             ; preds = %.preheader85.preheader.prol.loopexit.loopexit, %.preheader85.preheader.preheader
  %indvars.iv105158.unr = phi i64 [ 0, %.preheader85.preheader.preheader ], [ %indvars.iv.next106.prol, %.preheader85.preheader.prol.loopexit.loopexit ]
  %57 = icmp ult i64 %55, 3
  br i1 %57, label %.preheader84, label %.preheader85._crit_edge.3.preheader

.preheader85._crit_edge.3.preheader:              ; preds = %.preheader85.preheader.prol.loopexit
  %58 = add nsw i64 %52, -4
  %59 = sub i64 %58, %indvars.iv105158.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod210 = icmp eq i64 %61, 0
  br i1 %lcmp.mod210, label %.preheader85._crit_edge.3.prol.preheader, label %.preheader85._crit_edge.3.prol.loopexit

.preheader85._crit_edge.3.prol.preheader:         ; preds = %.preheader85._crit_edge.3.preheader
  br label %.preheader85._crit_edge.3.prol

.preheader85._crit_edge.3.prol:                   ; preds = %.preheader85._crit_edge.3.prol.preheader
  %62 = mul nuw nsw i64 %indvars.iv105158.unr, 16000
  %scevgep184.prol212 = getelementptr i8, i8* %50, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.prol212, i8 0, i64 %54, i32 8, i1 false)
  %63 = mul i64 %indvars.iv105158.unr, 16000
  %64 = add i64 %63, 16000
  %scevgep184.1.prol = getelementptr i8, i8* %50, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.1.prol, i8 0, i64 %54, i32 8, i1 false)
  %65 = mul i64 %indvars.iv105158.unr, 16000
  %66 = add i64 %65, 32000
  %scevgep184.2.prol = getelementptr i8, i8* %50, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.2.prol, i8 0, i64 %54, i32 8, i1 false)
  %67 = mul i64 %indvars.iv105158.unr, 16000
  %68 = add i64 %67, 48000
  %scevgep184.3.prol = getelementptr i8, i8* %50, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.3.prol, i8 0, i64 %54, i32 8, i1 false)
  %indvars.iv.next106.3.prol = add nsw i64 %indvars.iv105158.unr, 4
  br label %.preheader85._crit_edge.3.prol.loopexit

.preheader85._crit_edge.3.prol.loopexit:          ; preds = %.preheader85._crit_edge.3.prol, %.preheader85._crit_edge.3.preheader
  %indvars.iv105158.unr213 = phi i64 [ %indvars.iv105158.unr, %.preheader85._crit_edge.3.preheader ], [ %indvars.iv.next106.3.prol, %.preheader85._crit_edge.3.prol ]
  %69 = icmp eq i64 %60, 0
  br i1 %69, label %.preheader84.loopexit, label %.preheader85._crit_edge.3.preheader.new

.preheader85._crit_edge.3.preheader.new:          ; preds = %.preheader85._crit_edge.3.prol.loopexit
  br label %.preheader85._crit_edge.3

.preheader84.loopexit.unr-lcssa:                  ; preds = %.preheader85._crit_edge.3
  br label %.preheader84.loopexit

.preheader84.loopexit:                            ; preds = %.preheader85._crit_edge.3.prol.loopexit, %.preheader84.loopexit.unr-lcssa
  br label %.preheader84

.preheader84:                                     ; preds = %.preheader84.loopexit, %.preheader85.preheader.prol.loopexit
  %70 = sext i32 %0 to i64
  %71 = icmp sgt i32 %0, 0
  br i1 %71, label %.preheader83.preheader.preheader, label %._crit_edge

.preheader83.preheader.preheader:                 ; preds = %.preheader84
  %wide.trip.count97 = zext i32 %0 to i64
  %wide.trip.count93 = zext i32 %0 to i64
  %xtraiter181 = and i64 %wide.trip.count93, 1
  %lcmp.mod182 = icmp eq i64 %xtraiter181, 0
  %72 = icmp eq i32 %0, 1
  br label %.preheader82.preheader.preheader

.preheader82.preheader.preheader:                 ; preds = %.preheader83.preheader.preheader, %.preheader83._crit_edge
  %indvars.iv99138 = phi i64 [ %indvars.iv.next100, %.preheader83._crit_edge ], [ 0, %.preheader83.preheader.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv99138
  br label %.preheader82.preheader

.preheader81:                                     ; preds = %.preheader83._crit_edge
  %74 = sext i32 %0 to i64
  %75 = icmp sgt i32 %0, 0
  br i1 %75, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader81
  %wide.trip.count = zext i32 %0 to i64
  %76 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %77 = icmp ult i64 %76, 3
  br label %.preheader.preheader

.preheader82.preheader:                           ; preds = %.preheader82.preheader.preheader, %.preheader83
  %indvars.iv95136 = phi i64 [ %indvars.iv.next96, %.preheader83 ], [ 0, %.preheader82.preheader.preheader ]
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95136, i64 %indvars.iv99138
  br i1 %lcmp.mod182, label %.preheader82.prol.loopexit, label %.preheader82.prol

.preheader82.prol:                                ; preds = %.preheader82.preheader
  %79 = load double, double* %78, align 8
  %80 = load double, double* %73, align 8
  %81 = fmul double %79, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv95136, i64 0
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  br label %.preheader82.prol.loopexit

.preheader82.prol.loopexit:                       ; preds = %.preheader82.prol, %.preheader82.preheader
  %indvars.iv91133.unr.ph = phi i64 [ 1, %.preheader82.prol ], [ 0, %.preheader82.preheader ]
  br i1 %72, label %.preheader83, label %.preheader82.preheader207

.preheader82.preheader207:                        ; preds = %.preheader82.prol.loopexit
  br label %.preheader82

.preheader82:                                     ; preds = %.preheader82.preheader207, %.preheader82
  %indvars.iv91133 = phi i64 [ %indvars.iv.next92.1, %.preheader82 ], [ %indvars.iv91133.unr.ph, %.preheader82.preheader207 ]
  %85 = load double, double* %78, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91133, i64 %indvars.iv99138
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv95136, i64 %indvars.iv91133
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91133, 1
  %92 = load double, double* %78, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next92, i64 %indvars.iv99138
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv95136, i64 %indvars.iv.next92
  %97 = load double, double* %96, align 8
  %98 = fadd double %97, %95
  store double %98, double* %96, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91133, 2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next92.1, %wide.trip.count93
  br i1 %exitcond94.1, label %.preheader83.loopexit, label %.preheader82

.preheader83.loopexit:                            ; preds = %.preheader82
  br label %.preheader83

.preheader83:                                     ; preds = %.preheader83.loopexit, %.preheader82.prol.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95136, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %.preheader83._crit_edge, label %.preheader82.preheader

.preheader83._crit_edge:                          ; preds = %.preheader83
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99138, 1
  %exitcond183 = icmp eq i64 %indvars.iv.next100, %70
  br i1 %exitcond183, label %.preheader81, label %.preheader82.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv89130 = phi i64 [ %indvars.iv.next90, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  %indvars.iv129.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol ], [ %xtraiter, %.preheader.prol.preheader ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv89130, i64 %indvars.iv129.prol
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89130, i64 %indvars.iv129.prol
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv129.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.loopexit, label %.preheader.prol, !llvm.loop !3

.preheader.prol.loopexit.loopexit:                ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.preheader
  %indvars.iv129.unr = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.prol, %.preheader.prol.loopexit.loopexit ]
  br i1 %77, label %.preheader._crit_edge, label %.preheader.preheader206

.preheader.preheader206:                          ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader206, %.preheader
  %indvars.iv129 = phi i64 [ %indvars.iv.next.3, %.preheader ], [ %indvars.iv129.unr, %.preheader.preheader206 ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv89130, i64 %indvars.iv129
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89130, i64 %indvars.iv129
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv129, 1
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv89130, i64 %indvars.iv.next
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89130, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv129, 2
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv89130, i64 %indvars.iv.next.1
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89130, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv129, 3
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv89130, i64 %indvars.iv.next.2
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89130, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv129, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89130, 1
  %exitcond = icmp eq i64 %indvars.iv.next90, %74
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge171, %._crit_edge171.thread, %.preheader84, %.preheader81
  %124 = phi i8* [ %50, %.preheader81 ], [ %50, %.preheader84 ], [ %50, %._crit_edge171 ], [ %49, %._crit_edge171.thread ], [ %50, %._crit_edge.loopexit ]
  tail call void @free(i8* %124) #4
  ret void

.preheader85._crit_edge.3:                        ; preds = %.preheader85._crit_edge.3, %.preheader85._crit_edge.3.preheader.new
  %indvars.iv105158 = phi i64 [ %indvars.iv105158.unr213, %.preheader85._crit_edge.3.preheader.new ], [ %indvars.iv.next106.3.1, %.preheader85._crit_edge.3 ]
  %125 = mul nuw nsw i64 %indvars.iv105158, 16000
  %scevgep184 = getelementptr i8, i8* %50, i64 %125
  call void @llvm.memset.p0i8.i64(i8* %scevgep184, i8 0, i64 %54, i32 8, i1 false)
  %126 = mul i64 %indvars.iv105158, 16000
  %127 = add i64 %126, 16000
  %scevgep184.1 = getelementptr i8, i8* %50, i64 %127
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.1, i8 0, i64 %54, i32 8, i1 false)
  %128 = mul i64 %indvars.iv105158, 16000
  %129 = add i64 %128, 32000
  %scevgep184.2 = getelementptr i8, i8* %50, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.2, i8 0, i64 %54, i32 8, i1 false)
  %130 = mul i64 %indvars.iv105158, 16000
  %131 = add i64 %130, 48000
  %scevgep184.3 = getelementptr i8, i8* %50, i64 %131
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.3, i8 0, i64 %54, i32 8, i1 false)
  %indvars.iv.next106.3 = add nsw i64 %indvars.iv105158, 4
  %132 = mul nuw nsw i64 %indvars.iv.next106.3, 16000
  %scevgep184.1214 = getelementptr i8, i8* %50, i64 %132
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.1214, i8 0, i64 %54, i32 8, i1 false)
  %133 = mul i64 %indvars.iv.next106.3, 16000
  %134 = add i64 %133, 16000
  %scevgep184.1.1 = getelementptr i8, i8* %50, i64 %134
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.1.1, i8 0, i64 %54, i32 8, i1 false)
  %135 = mul i64 %indvars.iv.next106.3, 16000
  %136 = add i64 %135, 32000
  %scevgep184.2.1 = getelementptr i8, i8* %50, i64 %136
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.2.1, i8 0, i64 %54, i32 8, i1 false)
  %137 = mul i64 %indvars.iv.next106.3, 16000
  %138 = add i64 %137, 48000
  %scevgep184.3.1 = getelementptr i8, i8* %50, i64 %138
  call void @llvm.memset.p0i8.i64(i8* %scevgep184.3.1, i8 0, i64 %54, i32 8, i1 false)
  %indvars.iv.next106.3.1 = add nsw i64 %indvars.iv105158, 8
  %exitcond185.3.1 = icmp eq i64 %indvars.iv.next106.3.1, %52
  br i1 %exitcond185.3.1, label %.preheader84.loopexit.unr-lcssa, label %.preheader85._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = sext i32 %0 to i64
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader94.preheader.lr.ph, label %._crit_edge138

.preheader94.preheader.lr.ph:                     ; preds = %5
  %wide.trip.count126 = zext i32 %0 to i64
  br label %.preheader94.preheader

.preheader94.preheader:                           ; preds = %.preheader93._crit_edge, %.preheader94.preheader.lr.ph
  %indvars.iv128171 = phi i64 [ 0, %.preheader94.preheader.lr.ph ], [ %indvars.iv.next129, %.preheader93._crit_edge ]
  %exitcond116157 = icmp eq i64 %indvars.iv128171, 0
  br i1 %exitcond116157, label %.preheader93.preheader, label %.lr.ph159.preheader

.lr.ph159.preheader:                              ; preds = %.preheader94.preheader
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128171, i64 0
  br label %.lr.ph159

.preheader:                                       ; preds = %.preheader93._crit_edge
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph148.preheader, label %._crit_edge138

.lr.ph148.preheader:                              ; preds = %.preheader
  br label %.lr.ph148

.preheader93.preheader.loopexit:                  ; preds = %.preheader94
  br label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %.preheader93.preheader.loopexit, %.preheader94.preheader
  %exitcond127167 = icmp eq i64 %indvars.iv128171, %wide.trip.count126
  %exitcond121160 = icmp eq i64 %indvars.iv128171, 0
  %or.cond = or i1 %exitcond127167, %exitcond121160
  br i1 %or.cond, label %.preheader93._crit_edge, label %.lr.ph170.split.preheader

.lr.ph170.split.preheader:                        ; preds = %.preheader93.preheader
  %xtraiter184 = and i64 %indvars.iv128171, 1
  %lcmp.mod185 = icmp eq i64 %xtraiter184, 0
  %11 = icmp eq i64 %indvars.iv128171, 1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128171, i64 0
  br label %.lr.ph170.split

.lr.ph159:                                        ; preds = %.lr.ph159.preheader, %.preheader94
  %indvars.iv111158 = phi i64 [ %indvars.iv.next112, %.preheader94 ], [ 0, %.lr.ph159.preheader ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128171, i64 %indvars.iv111158
  %14 = load double, double* %13, align 8
  %exitcond110150 = icmp eq i64 %indvars.iv111158, 0
  br i1 %exitcond110150, label %.preheader94, label %.lr.ph154.preheader

.lr.ph154.preheader:                              ; preds = %.lr.ph159
  %xtraiter182 = and i64 %indvars.iv111158, 1
  %lcmp.mod183 = icmp eq i64 %xtraiter182, 0
  br i1 %lcmp.mod183, label %.lr.ph154.prol.loopexit, label %.lr.ph154.prol

.lr.ph154.prol:                                   ; preds = %.lr.ph154.preheader
  %15 = load double, double* %8, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv111158
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %14, %18
  br label %.lr.ph154.prol.loopexit

.lr.ph154.prol.loopexit:                          ; preds = %.lr.ph154.prol, %.lr.ph154.preheader
  %.lcssa176.unr.ph = phi double [ %19, %.lr.ph154.prol ], [ undef, %.lr.ph154.preheader ]
  %.0152.unr.ph = phi double [ %19, %.lr.ph154.prol ], [ %14, %.lr.ph154.preheader ]
  %indvars.iv106151.unr.ph = phi i64 [ 1, %.lr.ph154.prol ], [ 0, %.lr.ph154.preheader ]
  %20 = icmp eq i64 %indvars.iv111158, 1
  br i1 %20, label %.preheader94, label %.lr.ph154.preheader205

.lr.ph154.preheader205:                           ; preds = %.lr.ph154.prol.loopexit
  br label %.lr.ph154

.lr.ph154:                                        ; preds = %.lr.ph154.preheader205, %.lr.ph154
  %.0152 = phi double [ %34, %.lr.ph154 ], [ %.0152.unr.ph, %.lr.ph154.preheader205 ]
  %indvars.iv106151 = phi i64 [ %indvars.iv.next107.1, %.lr.ph154 ], [ %indvars.iv106151.unr.ph, %.lr.ph154.preheader205 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128171, i64 %indvars.iv106151
  %22 = bitcast double* %21 to <2 x double>*
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106151, i64 %indvars.iv111158
  %24 = load double, double* %23, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106151, 1
  %25 = load <2 x double>, <2 x double>* %22, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next107, i64 %indvars.iv111158
  %27 = load double, double* %26, align 8
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %25, %29
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %.0152, %31
  %34 = fsub double %33, %32
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106151, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next107.1, %indvars.iv111158
  br i1 %exitcond110.1, label %.preheader94.loopexit, label %.lr.ph154

.preheader94.loopexit:                            ; preds = %.lr.ph154
  br label %.preheader94

.preheader94:                                     ; preds = %.preheader94.loopexit, %.lr.ph154.prol.loopexit, %.lr.ph159
  %.0.lcssa = phi double [ %14, %.lr.ph159 ], [ %.lcssa176.unr.ph, %.lr.ph154.prol.loopexit ], [ %34, %.preheader94.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111158, i64 %indvars.iv111158
  %36 = load double, double* %35, align 8
  %37 = fdiv double %.0.lcssa, %36
  store double %37, double* %13, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111158, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next112, %indvars.iv128171
  br i1 %exitcond116, label %.preheader93.preheader.loopexit, label %.lr.ph159

.lr.ph170.split:                                  ; preds = %.lr.ph170.split.preheader, %.preheader93
  %indvars.iv124168 = phi i64 [ %indvars.iv.next125, %.preheader93 ], [ %indvars.iv128171, %.lr.ph170.split.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128171, i64 %indvars.iv124168
  %39 = load double, double* %38, align 8
  br i1 %lcmp.mod185, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph170.split
  %40 = load double, double* %12, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv124168
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %39, %43
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph170.split
  %.lcssa177.unr.ph = phi double [ %44, %.prol.preheader ], [ undef, %.lr.ph170.split ]
  %.1162.unr.ph = phi double [ %44, %.prol.preheader ], [ %39, %.lr.ph170.split ]
  %indvars.iv117161.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph170.split ]
  br i1 %11, label %.preheader93, label %.lr.ph170.split.new.preheader

.lr.ph170.split.new.preheader:                    ; preds = %.prol.loopexit
  br label %.lr.ph170.split.new

.lr.ph170.split.new:                              ; preds = %.lr.ph170.split.new.preheader, %.lr.ph170.split.new
  %.1162 = phi double [ %58, %.lr.ph170.split.new ], [ %.1162.unr.ph, %.lr.ph170.split.new.preheader ]
  %indvars.iv117161 = phi i64 [ %indvars.iv.next118.1, %.lr.ph170.split.new ], [ %indvars.iv117161.unr.ph, %.lr.ph170.split.new.preheader ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128171, i64 %indvars.iv117161
  %46 = bitcast double* %45 to <2 x double>*
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv117161, i64 %indvars.iv124168
  %48 = load double, double* %47, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117161, 1
  %49 = load <2 x double>, <2 x double>* %46, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next118, i64 %indvars.iv124168
  %51 = load double, double* %50, align 8
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fmul <2 x double> %49, %53
  %55 = extractelement <2 x double> %54, i32 0
  %56 = extractelement <2 x double> %54, i32 1
  %57 = fsub double %.1162, %55
  %58 = fsub double %57, %56
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117161, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next118.1, %indvars.iv128171
  br i1 %exitcond121.1, label %.preheader93.loopexit, label %.lr.ph170.split.new

.preheader93.loopexit:                            ; preds = %.lr.ph170.split.new
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.loopexit, %.prol.loopexit
  %.lcssa177 = phi double [ %.lcssa177.unr.ph, %.prol.loopexit ], [ %58, %.preheader93.loopexit ]
  store double %.lcssa177, double* %38, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124168, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next125, %wide.trip.count126
  br i1 %exitcond127, label %.preheader93._crit_edge.loopexit, label %.lr.ph170.split

.preheader93._crit_edge.loopexit:                 ; preds = %.preheader93
  br label %.preheader93._crit_edge

.preheader93._crit_edge:                          ; preds = %.preheader93._crit_edge.loopexit, %.preheader93.preheader
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128171, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next129, %6
  br i1 %exitcond186, label %.preheader, label %.preheader94.preheader

.lr.ph148:                                        ; preds = %.lr.ph148.preheader, %._crit_edge144
  %indvars.iv104146 = phi i64 [ %indvars.iv.next105, %._crit_edge144 ], [ 0, %.lr.ph148.preheader ]
  %59 = add nsw i64 %indvars.iv104146, -1
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv104146
  %61 = load double, double* %60, align 8
  %exitcond139 = icmp eq i64 %indvars.iv104146, 0
  br i1 %exitcond139, label %._crit_edge144, label %.lr.ph143.preheader

.lr.ph143.preheader:                              ; preds = %.lr.ph148
  %xtraiter179 = and i64 %indvars.iv104146, 3
  %lcmp.mod180 = icmp eq i64 %xtraiter179, 0
  br i1 %lcmp.mod180, label %.lr.ph143.prol.loopexit, label %.lr.ph143.prol.preheader

.lr.ph143.prol.preheader:                         ; preds = %.lr.ph143.preheader
  br label %.lr.ph143.prol

.lr.ph143.prol:                                   ; preds = %.lr.ph143.prol.preheader, %.lr.ph143.prol
  %.2141.prol = phi double [ %67, %.lr.ph143.prol ], [ %61, %.lr.ph143.prol.preheader ]
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph143.prol ], [ 0, %.lr.ph143.prol.preheader ]
  %prol.iter181 = phi i64 [ %prol.iter181.sub, %.lr.ph143.prol ], [ %xtraiter179, %.lr.ph143.prol.preheader ]
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104146, i64 %indvars.iv140.prol
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %.2141.prol, %66
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter181.sub = add i64 %prol.iter181, -1
  %prol.iter181.cmp = icmp eq i64 %prol.iter181.sub, 0
  br i1 %prol.iter181.cmp, label %.lr.ph143.prol.loopexit.loopexit, label %.lr.ph143.prol, !llvm.loop !4

.lr.ph143.prol.loopexit.loopexit:                 ; preds = %.lr.ph143.prol
  br label %.lr.ph143.prol.loopexit

.lr.ph143.prol.loopexit:                          ; preds = %.lr.ph143.prol.loopexit.loopexit, %.lr.ph143.preheader
  %.lcssa175.unr = phi double [ undef, %.lr.ph143.preheader ], [ %67, %.lr.ph143.prol.loopexit.loopexit ]
  %.2141.unr = phi double [ %61, %.lr.ph143.preheader ], [ %67, %.lr.ph143.prol.loopexit.loopexit ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph143.preheader ], [ %indvars.iv.next.prol, %.lr.ph143.prol.loopexit.loopexit ]
  %68 = icmp ult i64 %59, 3
  br i1 %68, label %._crit_edge144, label %.lr.ph143.preheader204

.lr.ph143.preheader204:                           ; preds = %.lr.ph143.prol.loopexit
  br label %.lr.ph143

.lr.ph143:                                        ; preds = %.lr.ph143.preheader204, %.lr.ph143
  %.2141 = phi double [ %90, %.lr.ph143 ], [ %.2141.unr, %.lr.ph143.preheader204 ]
  %indvars.iv140 = phi i64 [ %indvars.iv.next.3, %.lr.ph143 ], [ %indvars.iv140.unr, %.lr.ph143.preheader204 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104146, i64 %indvars.iv140
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %72 = bitcast double* %71 to <2 x double>*
  %73 = load <2 x double>, <2 x double>* %70, align 8
  %74 = load <2 x double>, <2 x double>* %72, align 8
  %75 = fmul <2 x double> %73, %74
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fsub double %.2141, %76
  %79 = fsub double %78, %77
  %indvars.iv.next.1 = add nsw i64 %indvars.iv140, 2
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104146, i64 %indvars.iv.next.1
  %81 = bitcast double* %80 to <2 x double>*
  %82 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %83 = bitcast double* %82 to <2 x double>*
  %84 = load <2 x double>, <2 x double>* %81, align 8
  %85 = load <2 x double>, <2 x double>* %83, align 8
  %86 = fmul <2 x double> %84, %85
  %87 = extractelement <2 x double> %86, i32 0
  %88 = extractelement <2 x double> %86, i32 1
  %89 = fsub double %79, %87
  %90 = fsub double %89, %88
  %indvars.iv.next.3 = add nsw i64 %indvars.iv140, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv104146
  br i1 %exitcond.3, label %._crit_edge144.loopexit, label %.lr.ph143

._crit_edge144.loopexit:                          ; preds = %.lr.ph143
  br label %._crit_edge144

._crit_edge144:                                   ; preds = %._crit_edge144.loopexit, %.lr.ph143.prol.loopexit, %.lr.ph148
  %.2.lcssa = phi double [ %61, %.lr.ph148 ], [ %.lcssa175.unr, %.lr.ph143.prol.loopexit ], [ %90, %._crit_edge144.loopexit ]
  %91 = getelementptr inbounds double, double* %4, i64 %indvars.iv104146
  store double %.2.lcssa, double* %91, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104146, 1
  %exitcond = icmp eq i64 %indvars.iv.next105, %9
  br i1 %exitcond, label %._crit_edge149, label %.lr.ph148

._crit_edge149:                                   ; preds = %._crit_edge144
  %92 = add nsw i32 %0, -1
  %93 = sext i32 %92 to i64
  %94 = sext i32 %0 to i64
  %95 = icmp sgt i32 %0, 0
  br i1 %95, label %.lr.ph137.preheader, label %._crit_edge138

.lr.ph137.preheader:                              ; preds = %._crit_edge149
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 %93, i64 0
  %96 = add nsw i64 %94, 3
  %97 = sub nsw i64 %96, %93
  %98 = add nsw i64 %94, -2
  %99 = sub nsw i64 %98, %93
  br label %.lr.ph137

.lr.ph137:                                        ; preds = %.lr.ph137.preheader, %._crit_edge
  %indvar = phi i64 [ 0, %.lr.ph137.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv98.in135 = phi double* [ %scevgep, %.lr.ph137.preheader ], [ %138, %._crit_edge ]
  %indvars.iv100133 = phi i64 [ %93, %.lr.ph137.preheader ], [ %indvars.iv.next101, %._crit_edge ]
  %100 = add nsw i64 %99, %indvar
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv100133
  %102 = load double, double* %101, align 8
  %indvars.iv.next96130 = add nsw i64 %indvars.iv100133, 1
  %103 = icmp slt i64 %indvars.iv.next96130, %94
  br i1 %103, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph137
  %104 = add i64 %97, %indvar
  %xtraiter = and i64 %104, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.next96132.prol = phi i64 [ %indvars.iv.next96.prol, %.lr.ph.prol ], [ %indvars.iv.next96130, %.lr.ph.prol.preheader ]
  %.3131.prol = phi double [ %110, %.lr.ph.prol ], [ %102, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100133, i64 %indvars.iv.next96132.prol
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next96132.prol
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fsub double %.3131.prol, %109
  %indvars.iv.next96.prol = add nsw i64 %indvars.iv.next96132.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv.next96132.unr = phi i64 [ %indvars.iv.next96130, %.lr.ph.preheader ], [ %indvars.iv.next96.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.3131.unr = phi double [ %102, %.lr.ph.preheader ], [ %110, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %110, %.lr.ph.prol.loopexit.loopexit ]
  %111 = icmp ult i64 %100, 3
  br i1 %111, label %._crit_edge, label %.lr.ph.preheader203

.lr.ph.preheader203:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader203, %.lr.ph
  %indvars.iv.next96132 = phi i64 [ %indvars.iv.next96.3, %.lr.ph ], [ %indvars.iv.next96132.unr, %.lr.ph.preheader203 ]
  %.3131 = phi double [ %133, %.lr.ph ], [ %.3131.unr, %.lr.ph.preheader203 ]
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100133, i64 %indvars.iv.next96132
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next96132
  %115 = bitcast double* %114 to <2 x double>*
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %.3131, %119
  %122 = fsub double %121, %120
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv.next96132, 2
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100133, i64 %indvars.iv.next96.1
  %124 = bitcast double* %123 to <2 x double>*
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next96.1
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %124, align 8
  %128 = load <2 x double>, <2 x double>* %126, align 8
  %129 = fmul <2 x double> %127, %128
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = fsub double %122, %130
  %133 = fsub double %132, %131
  %indvars.iv.next96.3 = add nsw i64 %indvars.iv.next96132, 4
  %exitcond178.3 = icmp eq i64 %indvars.iv.next96.3, %94
  br i1 %exitcond178.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph137
  %.3.lcssa = phi double [ %102, %.lr.ph137 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %133, %._crit_edge.loopexit ]
  %134 = getelementptr inbounds double, double* %indvars.iv98.in135, i64 %indvars.iv100133
  %135 = load double, double* %134, align 8
  %136 = fdiv double %.3.lcssa, %135
  %137 = getelementptr inbounds double, double* %3, i64 %indvars.iv100133
  store double %136, double* %137, align 8
  %indvars.iv.next101 = add nsw i64 %indvars.iv100133, -1
  %138 = getelementptr double, double* %indvars.iv98.in135, i64 -2000
  %139 = icmp sgt i64 %indvars.iv100133, 0
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %139, label %.lr.ph137, label %._crit_edge138.loopexit

._crit_edge138.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge138

._crit_edge138:                                   ; preds = %._crit_edge138.loopexit, %5, %.preheader, %._crit_edge149
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %14
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv5 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %.lr.ph, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
