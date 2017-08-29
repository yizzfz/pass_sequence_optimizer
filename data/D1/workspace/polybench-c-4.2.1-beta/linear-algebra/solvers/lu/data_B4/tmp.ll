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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader14.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count87 = zext i32 %0 to i64
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40, %.preheader14.lr.ph
  %indvars.iv85 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next86, %._crit_edge40 ]
  %indvars.iv83 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next84, %._crit_edge40 ]
  %9 = mul nuw nsw i64 %indvars.iv85, 2001
  %10 = add nuw nsw i64 %9, 1
  %11 = sub i64 %7, %indvars.iv85
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %14 = icmp slt i64 %indvars.iv.next86, %8
  br i1 %14, label %._crit_edge40.loopexit, label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv69 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next70, %._crit_edge ]
  %15 = sub nsw i64 0, %indvars.iv69
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %5
  %20 = fadd double %19, 1.000000e+00
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv69
  store double %20, double* %21, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next70, %indvars.iv83
  br i1 %exitcond74, label %.preheader13, label %._crit_edge

._crit_edge40.loopexit:                           ; preds = %.preheader13
  %22 = add nuw nsw i64 %13, 8
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %23 = bitcast double* %scevgep81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %23, i8 0, i64 %22, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %.preheader13, %._crit_edge40.loopexit
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %._crit_edge42, label %.lr.ph36

._crit_edge42:                                    ; preds = %._crit_edge40
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader12.us.preheader, label %._crit_edge17

.preheader12.us.preheader:                        ; preds = %._crit_edge42
  %27 = add i32 %0, -1
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add nuw nsw i64 %29, 8
  %31 = zext i32 %0 to i64
  %32 = add nsw i64 %31, -1
  %xtraiter93 = and i64 %31, 3
  %lcmp.mod94 = icmp eq i64 %xtraiter93, 0
  br i1 %lcmp.mod94, label %.preheader12.us.prol.loopexit, label %._crit_edge33.us.prol.preheader

._crit_edge33.us.prol.preheader:                  ; preds = %.preheader12.us.preheader
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol.preheader, %._crit_edge33.us.prol
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %._crit_edge33.us.prol ], [ 0, %._crit_edge33.us.prol.preheader ]
  %prol.iter95 = phi i64 [ %prol.iter95.sub, %._crit_edge33.us.prol ], [ %xtraiter93, %._crit_edge33.us.prol.preheader ]
  %33 = mul nuw nsw i64 %indvars.iv65.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter95.sub = add nsw i64 %prol.iter95, -1
  %prol.iter95.cmp = icmp eq i64 %prol.iter95.sub, 0
  br i1 %prol.iter95.cmp, label %.preheader12.us.prol.loopexit.loopexit, label %._crit_edge33.us.prol, !llvm.loop !1

.preheader12.us.prol.loopexit.loopexit:           ; preds = %._crit_edge33.us.prol
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %.preheader12.us.prol.loopexit.loopexit, %.preheader12.us.preheader
  %indvars.iv65.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %xtraiter93, %.preheader12.us.prol.loopexit.loopexit ]
  %34 = icmp ult i64 %32, 3
  br i1 %34, label %.preheader11, label %._crit_edge33.us.3.preheader

._crit_edge33.us.3.preheader:                     ; preds = %.preheader12.us.prol.loopexit
  %wide.trip.count67.3 = zext i32 %0 to i64
  %35 = add nsw i64 %31, -4
  %36 = sub nsw i64 %35, %indvars.iv65.unr
  %37 = lshr i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %._crit_edge33.us.3.prol.preheader, label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.preheader:                ; preds = %._crit_edge33.us.3.preheader
  br label %._crit_edge33.us.3.prol

._crit_edge33.us.3.prol:                          ; preds = %._crit_edge33.us.3.prol.preheader
  %39 = mul nuw nsw i64 %indvars.iv65.unr, 16000
  %scevgep.prol104 = getelementptr i8, i8* %25, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol104, i8 0, i64 %30, i32 8, i1 false)
  %40 = mul nuw nsw i64 %indvars.iv65.unr, 16000
  %41 = add nuw nsw i64 %40, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %30, i32 8, i1 false)
  %42 = mul nuw nsw i64 %indvars.iv65.unr, 16000
  %43 = add nuw nsw i64 %42, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %30, i32 8, i1 false)
  %44 = mul nuw nsw i64 %indvars.iv65.unr, 16000
  %45 = add nuw nsw i64 %44, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next66.3.prol = or i64 %indvars.iv65.unr, 4
  br label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.loopexit:                 ; preds = %._crit_edge33.us.3.prol, %._crit_edge33.us.3.preheader
  %indvars.iv65.unr105 = phi i64 [ %indvars.iv65.unr, %._crit_edge33.us.3.preheader ], [ %indvars.iv.next66.3.prol, %._crit_edge33.us.3.prol ]
  %46 = icmp eq i64 %37, 0
  br i1 %46, label %.preheader11.loopexit, label %._crit_edge33.us.3.preheader.new

._crit_edge33.us.3.preheader.new:                 ; preds = %._crit_edge33.us.3.prol.loopexit
  br label %._crit_edge33.us.3

.preheader11.loopexit.unr-lcssa:                  ; preds = %._crit_edge33.us.3
  br label %.preheader11.loopexit

.preheader11.loopexit:                            ; preds = %._crit_edge33.us.3.prol.loopexit, %.preheader11.loopexit.unr-lcssa
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %.preheader12.us.prol.loopexit
  %47 = icmp sgt i32 %0, 0
  br i1 %47, label %.preheader9.us.us.preheader.preheader, label %._crit_edge17

.preheader9.us.us.preheader.preheader:            ; preds = %.preheader11
  %48 = and i32 %0, 1
  %wide.trip.count55 = zext i32 %0 to i64
  %wide.trip.count51.1 = zext i32 %0 to i64
  %wide.trip.count59 = zext i32 %0 to i64
  %49 = icmp eq i32 %48, 0
  %50 = icmp eq i32 %0, 1
  %51 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us, %.preheader9.us.us.preheader.preheader
  %indvars.iv57 = phi i64 [ 0, %.preheader9.us.us.preheader.preheader ], [ %indvars.iv.next58, %._crit_edge22.us ]
  %sunkaddr99 = shl nuw nsw i64 %indvars.iv57, 3
  %sunkaddr100 = add i64 %sunkaddr, %sunkaddr99
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to double*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %.preheader8, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us.us ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv57
  br i1 %49, label %.prol.loopexit90, label %.prol.preheader89

.prol.preheader89:                                ; preds = %.preheader9.us.us
  %54 = load double, double* %53, align 8
  %55 = load double, double* %sunkaddr101, align 8
  %56 = fmul double %54, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv53, i64 0
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  br label %.prol.loopexit90

.prol.loopexit90:                                 ; preds = %.preheader9.us.us, %.prol.preheader89
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader89 ], [ 0, %.preheader9.us.us ]
  br i1 %50, label %._crit_edge20.us.us, label %.preheader9.us.us.new.preheader

.preheader9.us.us.new.preheader:                  ; preds = %.prol.loopexit90
  br label %.preheader9.us.us.new

._crit_edge20.us.us.loopexit:                     ; preds = %.preheader9.us.us.new
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %.prol.loopexit90
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge22.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new.preheader, %.preheader9.us.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader9.us.us.new ], [ %indvars.iv49.unr.ph, %.preheader9.us.us.new.preheader ]
  %60 = load double, double* %53, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv57
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %67 = load double, double* %53, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv57
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next50
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond52.1, label %._crit_edge20.us.us.loopexit, label %.preheader9.us.us.new

.preheader8:                                      ; preds = %._crit_edge22.us
  %74 = icmp sgt i32 %0, 0
  br i1 %74, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader8
  %75 = zext i32 %0 to i64
  %76 = add nsw i64 %75, -1
  %xtraiter = and i64 %75, 3
  %wide.trip.count47 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %77 = icmp eq i64 %xtraiter, 0
  %78 = icmp ult i64 %76, 3
  %79 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %80 = bitcast i8* %25 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us ]
  br i1 %77, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv45, i64 %indvars.iv.prol
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.prol
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %xtraiter, %.prol.loopexit.loopexit ]
  br i1 %78, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader8, %.preheader11, %._crit_edge42, %._crit_edge42.thread
  %106 = phi i8* [ %4, %._crit_edge42.thread ], [ %25, %._crit_edge42 ], [ %25, %.preheader11 ], [ %25, %.preheader8 ], [ %25, %._crit_edge17.loopexit ]
  tail call void @free(i8* %106) #4
  ret void

._crit_edge33.us.3:                               ; preds = %._crit_edge33.us.3, %._crit_edge33.us.3.preheader.new
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr105, %._crit_edge33.us.3.preheader.new ], [ %indvars.iv.next66.3.1, %._crit_edge33.us.3 ]
  %107 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %30, i32 8, i1 false)
  %108 = mul i64 %indvars.iv65, 16000
  %109 = add i64 %108, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %30, i32 8, i1 false)
  %110 = mul i64 %indvars.iv65, 16000
  %111 = add i64 %110, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %30, i32 8, i1 false)
  %112 = mul i64 %indvars.iv65, 16000
  %113 = add i64 %112, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %113
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %114 = mul nuw nsw i64 %indvars.iv.next66.3, 16000
  %scevgep.1106 = getelementptr i8, i8* %25, i64 %114
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1106, i8 0, i64 %30, i32 8, i1 false)
  %115 = mul i64 %indvars.iv.next66.3, 16000
  %116 = add i64 %115, 16000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %116
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %30, i32 8, i1 false)
  %117 = mul i64 %indvars.iv.next66.3, 16000
  %118 = add i64 %117, 32000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %118
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %30, i32 8, i1 false)
  %119 = mul i64 %indvars.iv.next66.3, 16000
  %120 = add i64 %119, 48000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %120
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next66.3.1 = add nsw i64 %indvars.iv65, 8
  %exitcond68.3.1 = icmp eq i64 %indvars.iv.next66.3.1, %wide.trip.count67.3
  br i1 %exitcond68.3.1, label %.preheader11.loopexit.unr-lcssa, label %._crit_edge33.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader, label %._crit_edge17

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count41 = zext i32 %0 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge13, %.preheader6.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next40, %._crit_edge13 ]
  %4 = icmp sgt i64 %indvars.iv39, 0
  br i1 %4, label %.preheader4.preheader, label %._crit_edge13

.preheader4.preheader:                            ; preds = %.preheader6
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 0
  br label %.preheader4

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %6 = icmp sgt i64 %indvars.iv39, 0
  br i1 %6, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter45 = and i64 %indvars.iv39, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 0
  %8 = icmp eq i64 %xtraiter45, 0
  %9 = icmp eq i64 %indvars.iv39, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv39, %.preheader.us.preheader ], [ %indvars.iv.next36, %._crit_edge11.us ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv35
  br i1 %8, label %.prol.loopexit44, label %.prol.preheader43

.prol.preheader43:                                ; preds = %.preheader.us
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv35
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = load double, double* %10, align 8
  %16 = fsub double %15, %14
  store double %16, double* %10, align 8
  br label %.prol.loopexit44

.prol.loopexit44:                                 ; preds = %.preheader.us, %.prol.preheader43
  %indvars.iv28.unr.ph = phi i64 [ 1, %.prol.preheader43 ], [ 0, %.preheader.us ]
  br i1 %9, label %._crit_edge11.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit44
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.preheader.us.new ], [ %indvars.iv28.unr.ph, %.preheader.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv28
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv35
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = load double, double* %10, align 8
  %23 = fsub double %22, %21
  store double %23, double* %10, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv.next29
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next29, i64 %indvars.iv35
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = load double, double* %10, align 8
  %30 = fsub double %29, %28
  store double %30, double* %10, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next29.1, %indvars.iv39
  br i1 %exitcond32.1, label %._crit_edge11.us.loopexit, label %.preheader.us.new

._crit_edge11.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit44
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %._crit_edge13.loopexit, label %.preheader.us

.preheader4:                                      ; preds = %._crit_edge, %.preheader4.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %31 = icmp sgt i64 %indvars.iv21, 0
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader4
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv21
  %xtraiter = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %33 = load double, double* %5, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv21
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %32, align 8
  %38 = fsub double %37, %36
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %39 = icmp eq i64 %indvars.iv21, 1
  br i1 %39, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv21
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %32, align 8
  %46 = fsub double %45, %44
  store double %46, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv21
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %32, align 8
  %53 = fsub double %52, %51
  store double %53, double* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader4
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv21
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv21
  %57 = load double, double* %56, align 8
  %58 = fdiv double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv39
  br i1 %exitcond26, label %.preheader.lr.ph, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader.lr.ph, %.preheader6
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.loopexit, label %.preheader6

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %2
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge3.us ]
  %9 = mul nsw i64 %indvars.iv6, %8
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us

; <label>:14:                                     ; preds = %._crit_edge.us._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
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
