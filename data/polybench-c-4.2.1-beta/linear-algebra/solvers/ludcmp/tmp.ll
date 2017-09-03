; ModuleID = 'B.ll'
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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %12, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph39.preheader:
  br label %.lr.ph39

.lr.ph39:                                         ; preds = %.lr.ph39, %.lr.ph39.preheader
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph39 ], [ 0, %.lr.ph39.preheader ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next91 = or i64 %indvars.iv90, 1
  %7 = trunc i64 %indvars.iv.next91 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv90
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next91
  store double 0.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next91
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %15 = trunc i64 %indvars.iv.next91.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next91
  store double %19, double* %20, align 8
  %exitcond114.1 = icmp eq i64 %indvars.iv.next91.1, 2000
  br i1 %exitcond114.1, label %.lr.ph32.preheader, label %.lr.ph39

.lr.ph32.preheader:                               ; preds = %.lr.ph39
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %._crit_edge34, %.lr.ph32.preheader
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge34 ], [ 0, %.lr.ph32.preheader ]
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge34 ], [ 1, %.lr.ph32.preheader ]
  %21 = mul nuw nsw i64 %indvars.iv86, 2001
  %22 = add nuw nsw i64 %21, 1
  %scevgep109 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %22
  %scevgep109110 = bitcast double* %scevgep109 to i8*
  %23 = sub i64 1998, %indvars.iv86
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %28

._crit_edge10:                                    ; preds = %28
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %27 = icmp slt i64 %indvars.iv.next87, 2000
  br i1 %27, label %._crit_edge34.loopexit, label %._crit_edge34

; <label>:28:                                     ; preds = %28, %.lr.ph32
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %28 ], [ 0, %.lr.ph32 ]
  %29 = sub nsw i64 0, %indvars.iv72
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv86, i64 %indvars.iv72
  store double %34, double* %35, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv84
  br i1 %exitcond77, label %._crit_edge10, label %28

._crit_edge34.loopexit:                           ; preds = %._crit_edge10
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep109110, i8 0, i64 %26, i32 8, i1 false)
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %._crit_edge10
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv86, i64 %indvars.iv86
  store double 1.000000e+00, double* %36, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond112, label %._crit_edge36, label %.lr.ph32

._crit_edge36:                                    ; preds = %._crit_edge34
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %._crit_edge29.us.3

._crit_edge15.us.us.preheader:                    ; preds = %._crit_edge15.us.us.preheader.preheader, %._crit_edge25.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge25.us ], [ 0, %._crit_edge15.us.us.preheader.preheader ]
  br label %._crit_edge15.us.us

._crit_edge25.us:                                 ; preds = %._crit_edge23.us.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond102, label %._crit_edge16.us.preheader, label %._crit_edge15.us.us.preheader

._crit_edge16.us.preheader:                       ; preds = %._crit_edge25.us
  br label %._crit_edge16.us

._crit_edge15.us.us:                              ; preds = %._crit_edge23.us.us, %._crit_edge15.us.us.preheader
  %indvars.iv56 = phi i64 [ 0, %._crit_edge15.us.us.preheader ], [ %indvars.iv.next57, %._crit_edge23.us.us ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv60
  br label %._crit_edge15.us.us.new

._crit_edge23.us.us:                              ; preds = %._crit_edge15.us.us.new
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond100, label %._crit_edge25.us, label %._crit_edge15.us.us

._crit_edge15.us.us.new:                          ; preds = %._crit_edge15.us.us.new, %._crit_edge15.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %._crit_edge15.us.us.new ], [ 0, %._crit_edge15.us.us ]
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv60
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv56, i64 %indvars.iv52
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next53 = or i64 %indvars.iv52, 1
  %47 = load double, double* %39, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv60
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv56, i64 %indvars.iv.next53
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next53.1, 2000
  br i1 %exitcond98.1, label %._crit_edge23.us.us, label %._crit_edge15.us.us.new

._crit_edge16.us:                                 ; preds = %._crit_edge18.us, %._crit_edge16.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge18.us ], [ 0, %._crit_edge16.us.preheader ]
  br label %._crit_edge16.us.new

._crit_edge16.us.new:                             ; preds = %._crit_edge16.us.new, %._crit_edge16.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge16.us.new ], [ 0, %._crit_edge16.us ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv48, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond95.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond95.3, label %._crit_edge18.us, label %._crit_edge16.us.new

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.new
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond, label %._crit_edge20, label %._crit_edge16.us

._crit_edge20:                                    ; preds = %._crit_edge18.us
  tail call void @free(i8* %37) #4
  ret void

._crit_edge29.us.3:                               ; preds = %._crit_edge29.us.3, %._crit_edge36
  %indvars.iv68 = phi i64 [ 0, %._crit_edge36 ], [ %indvars.iv.next69.3.1, %._crit_edge29.us.3 ]
  %74 = mul nuw nsw i64 %indvars.iv68, 16000
  %scevgep = getelementptr i8, i8* %37, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %75 = mul nuw nsw i64 %indvars.iv68, 16000
  %76 = add nuw nsw i64 %75, 16000
  %scevgep.1 = getelementptr i8, i8* %37, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %77 = mul nuw nsw i64 %indvars.iv68, 16000
  %78 = add nuw nsw i64 %77, 32000
  %scevgep.2 = getelementptr i8, i8* %37, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %79 = mul nuw nsw i64 %indvars.iv68, 16000
  %80 = add nuw nsw i64 %79, 48000
  %scevgep.3 = getelementptr i8, i8* %37, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next69.3 = or i64 %indvars.iv68, 4
  %81 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %scevgep.1129 = getelementptr i8, i8* %37, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1129, i8 0, i64 16000, i32 8, i1 false)
  %82 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %83 = add nuw nsw i64 %82, 16000
  %scevgep.1.1 = getelementptr i8, i8* %37, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %84 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %85 = add nuw nsw i64 %84, 32000
  %scevgep.2.1 = getelementptr i8, i8* %37, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %86 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %87 = add nuw nsw i64 %86, 48000
  %scevgep.3.1 = getelementptr i8, i8* %37, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next69.3.1 = add nsw i64 %indvars.iv68, 8
  %exitcond106.3.1 = icmp eq i64 %indvars.iv.next69.3.1, 2000
  br i1 %exitcond106.3.1, label %._crit_edge15.us.us.preheader.preheader, label %._crit_edge29.us.3

._crit_edge15.us.us.preheader.preheader:          ; preds = %._crit_edge29.us.3
  br label %._crit_edge15.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
._crit_edge.preheader:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge44, %._crit_edge.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge44 ], [ 0, %._crit_edge.preheader ]
  %5 = icmp sgt i64 %indvars.iv84, 0
  br i1 %5, label %.lr.ph35.preheader, label %._crit_edge44

.lr.ph35.preheader:                               ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 0
  br label %.lr.ph35

.lr.ph43:                                         ; preds = %._crit_edge32
  %7 = icmp sgt i64 %indvars.iv84, 0
  br i1 %7, label %.lr.ph43.split.us.preheader, label %._crit_edge44

.lr.ph43.split.us.preheader:                      ; preds = %.lr.ph43
  %xtraiter98 = and i64 %indvars.iv84, 1
  %lcmp.mod99 = icmp eq i64 %xtraiter98, 0
  %8 = icmp eq i64 %indvars.iv84, 1
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 0
  br label %.lr.ph43.split.us

.lr.ph43.split.us:                                ; preds = %._crit_edge40.us, %.lr.ph43.split.us.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge40.us ], [ %indvars.iv84, %.lr.ph43.split.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv80
  %11 = load double, double* %10, align 8
  br i1 %lcmp.mod99, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph43.split.us
  %12 = load double, double* %9, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv80
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %11, %15
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph43.split.us
  %indvars.iv73.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph43.split.us ]
  %.137.us.unr.ph = phi double [ %16, %.prol.preheader ], [ %11, %.lr.ph43.split.us ]
  %.lcssa49.unr.ph = phi double [ %16, %.prol.preheader ], [ undef, %.lr.ph43.split.us ]
  br i1 %8, label %._crit_edge40.us, label %.lr.ph43.split.us.new.preheader

.lr.ph43.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph43.split.us.new

.lr.ph43.split.us.new:                            ; preds = %.lr.ph43.split.us.new, %.lr.ph43.split.us.new.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv.next74.1, %.lr.ph43.split.us.new ], [ %indvars.iv73.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %.137.us = phi double [ %28, %.lr.ph43.split.us.new ], [ %.137.us.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv73
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv80
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %.137.us, %21
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv.next74
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next74, i64 %indvars.iv80
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next74.1, %indvars.iv84
  br i1 %exitcond77.1, label %._crit_edge40.us.loopexit, label %.lr.ph43.split.us.new

._crit_edge40.us.loopexit:                        ; preds = %.lr.ph43.split.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit
  %.lcssa49 = phi double [ %.lcssa49.unr.ph, %.prol.loopexit ], [ %28, %._crit_edge40.us.loopexit ]
  store double %.lcssa49, double* %10, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond90, label %._crit_edge44.loopexit, label %.lr.ph43.split.us

.lr.ph35:                                         ; preds = %._crit_edge32, %.lr.ph35.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge32 ], [ 0, %.lr.ph35.preheader ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv66
  %30 = load double, double* %29, align 8
  %31 = icmp sgt i64 %indvars.iv66, 0
  br i1 %31, label %.lr.ph31.preheader, label %._crit_edge32

.lr.ph31.preheader:                               ; preds = %.lr.ph35
  %xtraiter96 = and i64 %indvars.iv66, 1
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  br i1 %lcmp.mod97, label %.lr.ph31.prol.loopexit, label %.lr.ph31.prol

.lr.ph31.prol:                                    ; preds = %.lr.ph31.preheader
  %32 = load double, double* %6, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv66
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %30, %35
  br label %.lr.ph31.prol.loopexit

.lr.ph31.prol.loopexit:                           ; preds = %.lr.ph31.prol, %.lr.ph31.preheader
  %indvars.iv61.unr.ph = phi i64 [ 1, %.lr.ph31.prol ], [ 0, %.lr.ph31.preheader ]
  %.029.unr.ph = phi double [ %36, %.lr.ph31.prol ], [ %30, %.lr.ph31.preheader ]
  %.lcssa48.unr.ph = phi double [ %36, %.lr.ph31.prol ], [ undef, %.lr.ph31.preheader ]
  %37 = icmp eq i64 %indvars.iv66, 1
  br i1 %37, label %._crit_edge32, label %.lr.ph31.preheader123

.lr.ph31.preheader123:                            ; preds = %.lr.ph31.prol.loopexit
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31, %.lr.ph31.preheader123
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.lr.ph31 ], [ %indvars.iv61.unr.ph, %.lr.ph31.preheader123 ]
  %.029 = phi double [ %49, %.lr.ph31 ], [ %.029.unr.ph, %.lr.ph31.preheader123 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv61
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv66
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %.029, %42
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv.next62
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next62, i64 %indvars.iv66
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next62.1, %indvars.iv66
  br i1 %exitcond65.1, label %._crit_edge32.loopexit, label %.lr.ph31

._crit_edge32.loopexit:                           ; preds = %.lr.ph31
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.lr.ph31.prol.loopexit, %.lr.ph35
  %.0.lcssa = phi double [ %30, %.lr.ph35 ], [ %.lcssa48.unr.ph, %.lr.ph31.prol.loopexit ], [ %49, %._crit_edge32.loopexit ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv66
  %51 = load double, double* %50, align 8
  %52 = fdiv double %.0.lcssa, %51
  store double %52, double* %29, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, %indvars.iv84
  br i1 %exitcond71, label %.lr.ph43, label %.lr.ph35

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %.lr.ph43, %._crit_edge
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next85, 2000
  br i1 %exitcond92, label %.lr.ph27.preheader, label %._crit_edge

.lr.ph27.preheader:                               ; preds = %._crit_edge44
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %._crit_edge24, %.lr.ph27.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge24 ], [ 0, %.lr.ph27.preheader ]
  %53 = add i64 %indvars.iv57, -1
  %54 = getelementptr inbounds double, double* %2, i64 %indvars.iv57
  %55 = load double, double* %54, align 8
  %56 = icmp sgt i64 %indvars.iv57, 0
  br i1 %56, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.lr.ph27
  %xtraiter93 = and i64 %indvars.iv57, 3
  %lcmp.mod94 = icmp eq i64 %xtraiter93, 0
  br i1 %lcmp.mod94, label %.lr.ph23.prol.loopexit, label %.lr.ph23.prol.preheader

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol, %.lr.ph23.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph23.prol ], [ 0, %.lr.ph23.prol.preheader ]
  %.221.prol = phi double [ %62, %.lr.ph23.prol ], [ %55, %.lr.ph23.prol.preheader ]
  %prol.iter95 = phi i64 [ %prol.iter95.sub, %.lr.ph23.prol ], [ %xtraiter93, %.lr.ph23.prol.preheader ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.prol
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fsub double %.221.prol, %61
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter95.sub = add i64 %prol.iter95, -1
  %prol.iter95.cmp = icmp eq i64 %prol.iter95.sub, 0
  br i1 %prol.iter95.cmp, label %.lr.ph23.prol.loopexit.loopexit, label %.lr.ph23.prol, !llvm.loop !1

.lr.ph23.prol.loopexit.loopexit:                  ; preds = %.lr.ph23.prol
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.loopexit, %.lr.ph23.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph23.preheader ], [ %indvars.iv.next.prol, %.lr.ph23.prol.loopexit.loopexit ]
  %.221.unr = phi double [ %55, %.lr.ph23.preheader ], [ %62, %.lr.ph23.prol.loopexit.loopexit ]
  %.lcssa47.unr = phi double [ undef, %.lr.ph23.preheader ], [ %62, %.lr.ph23.prol.loopexit.loopexit ]
  %63 = icmp ult i64 %53, 3
  br i1 %63, label %._crit_edge24, label %.lr.ph23.preheader122

.lr.ph23.preheader122:                            ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23, %.lr.ph23.preheader122
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph23 ], [ %indvars.iv.unr, %.lr.ph23.preheader122 ]
  %.221 = phi double [ %87, %.lr.ph23 ], [ %.221.unr, %.lr.ph23.preheader122 ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fsub double %.221, %68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.next
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %69, %74
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fsub double %75, %80
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.next.2
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fsub double %81, %86
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv57
  br i1 %exitcond56.3, label %._crit_edge24.loopexit, label %.lr.ph23

._crit_edge24.loopexit:                           ; preds = %.lr.ph23
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.lr.ph23.prol.loopexit, %.lr.ph27
  %.2.lcssa = phi double [ %55, %.lr.ph27 ], [ %.lcssa47.unr, %.lr.ph23.prol.loopexit ], [ %87, %._crit_edge24.loopexit ]
  %88 = getelementptr inbounds double, double* %4, i64 %indvars.iv57
  store double %.2.lcssa, double* %88, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond88, label %.lr.ph18.preheader, label %.lr.ph27

.lr.ph18.preheader:                               ; preds = %._crit_edge24
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %._crit_edge15, %.lr.ph18.preheader
  %indvar = phi i32 [ %indvar.next, %._crit_edge15 ], [ 0, %.lr.ph18.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge15 ], [ 2000, %.lr.ph18.preheader ]
  %89 = add i32 %indvar, -1
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next53
  %91 = load double, double* %90, align 8
  %92 = icmp slt i64 %indvars.iv52, 2000
  br i1 %92, label %.lr.ph.preheader, label %._crit_edge15

.lr.ph.preheader:                                 ; preds = %.lr.ph18
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.lr.ph.prol ], [ %indvars.iv52, %.lr.ph.prol.preheader ]
  %.313.prol = phi double [ %98, %.lr.ph.prol ], [ %91, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv50.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv50.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.313.prol, %97
  %indvars.iv.next51.prol = add nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv50.unr = phi i64 [ %indvars.iv52, %.lr.ph.preheader ], [ %indvars.iv.next51.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.313.unr = phi double [ %91, %.lr.ph.preheader ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %99 = icmp ult i32 %89, 3
  br i1 %99, label %._crit_edge15, label %.lr.ph.preheader121

.lr.ph.preheader121:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader121
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %.lr.ph ], [ %indvars.iv50.unr, %.lr.ph.preheader121 ]
  %.313 = phi double [ %123, %.lr.ph ], [ %.313.unr, %.lr.ph.preheader121 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv50
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fsub double %.313, %104
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next51
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %105, %110
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next51.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51.1
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %111, %116
  %indvars.iv.next51.2 = add nsw i64 %indvars.iv50, 3
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next51.2
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51.2
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fsub double %117, %122
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next51.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge15.loopexit, label %.lr.ph

._crit_edge15.loopexit:                           ; preds = %.lr.ph
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.lr.ph.prol.loopexit, %.lr.ph18
  %.3.lcssa = phi double [ %91, %.lr.ph18 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %123, %._crit_edge15.loopexit ]
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next53
  %125 = load double, double* %124, align 8
  %126 = fdiv double %.3.lcssa, %125
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  store double %126, double* %127, align 8
  %128 = icmp sgt i64 %indvars.iv52, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %128, label %.lr.ph18, label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond5, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
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
